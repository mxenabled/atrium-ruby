require "spec_helper"

RSpec.describe ::Atrium::Pageable do
  include_context "configure"

  class ExampleClass
    extend ::Atrium::Pageable
    include ::ActiveAttr::Model
    attribute :code
    attribute :name
    attribute :url
  end

  subject { ExampleClass }

  let(:first_institution) { ExampleClass.new({ "code" => "batman", "name" => "Batman Bank", "url" => "https://batman.com/" }) }
  let(:first_page_response) do
    {
      "institutions" => [
        { "code" => "batman", "name" => "Batman Bank", "url" => "https://batman.com/" },
        { "code" => "batman", "name" => "Batman CC", "url" => "None" },
      ],
      "pagination" => {
        "current_page" => 1, "per_page" => 25, "total_entries" => 50, "total_pages" => total_pages
      }
    }
  end
  let(:second_page_response) do
    {
      "institutions" => [
        { "code" => "batman", "name" => "Batman WBC", "url" => "https://www.batman.com" }
      ],
      "pagination" => {
        "current_page" => 2, "per_page" => 25, "total_entries" => 50, "total_pages" => total_pages
      }
    }
  end
  let(:total_pages) { 2 }

  before do
    allow(::Atrium.client).to receive(:make_request).with(:get, "/institutions?page=1&records_per_page=25").
                                and_return(first_page_response)
    allow(::Atrium.client).to receive(:make_request).with(:get, "/institutions?page=2&records_per_page=25").
                                and_return(second_page_response)
  end

  describe ".paginate" do
    it "makes a single request using the default limit" do
      expect(::Atrium.client).to receive(:make_request).with(:get, "/paginate_once?page=1&records_per_page=25").
                                   and_return(first_page_response).exactly(:twice)
      options = {
        :endpoint => "/paginate_once",
        :resource => "institutions"
      }
      batch_options = options.merge(:limit => 25)
      expect(subject).to receive(:paginate_in_batches).with(batch_options).and_call_original
      expect(subject.paginate(options).total_pages).to eq(1)
    end

    it "makes a single request using a custom limit" do
      expect(::Atrium.client).to receive(:make_request).with(:get, "/paginate_once?page=1&records_per_page=100").
                                   and_return(first_page_response).exactly(:twice)
      options = {
        :endpoint => "/paginate_once",
        :resource => "institutions",
        :records_per_page => 100,
      }
      batch_options = options.merge(:limit => 100)
      expect(subject).to receive(:paginate_in_batches).with(batch_options).and_call_original
      expect(subject.paginate(options).total_pages).to eq(1)
    end

    context "no results" do
      let(:empty_response) do
        {
          "institutions" => [],
          "pagination" => {"current_page" => 1, "per_page" => 25, "total_entries" => 0, "total_pages" => 1}
        }
      end

      it "returns an empty pagination batch" do
        expect(::Atrium.client).to receive(:make_request).with(:get, "/paginate_once?page=1&records_per_page=25").
                                     and_return(empty_response).exactly(:twice)
        options = {
          :endpoint => "/paginate_once",
          :resource => "institutions"
        }
        batch = subject.paginate(options)
        expect(batch).to eq(::Atrium::PaginationBatch.new)
      end
    end
  end

  describe ".paginate_each" do
    it "yields every transaction in each batch" do
      records_yielded = 0
      options = {
        :endpoint => "/institutions",
        :resource => "institutions"
      }
      subject.paginate_each(options) { records_yielded += 1 }
      expect(records_yielded).to eq(3)
    end
  end

  describe ".paginate_in_batches" do
    it "fails unless a block is given" do
      expect { subject.paginate_in_batches }.to raise_error(::ArgumentError)
    end

    context "single page response" do
      let(:total_pages) { 1 }

      it "yields a pagination batch" do
        batch = nil
        options = {
          :endpoint => "/institutions",
          :resource => "institutions"
        }
        subject.paginate_in_batches(options) { |b| batch = b }
        expect(batch.size).to eq(2)
        expect(batch.total_pages).to eq(1)
        expect(batch.total_entries).to eq(50)
        expect(batch.current_page).to eq(1)
        expect(batch.first).to eq(first_institution)
      end
    end

    context "multiple pages" do
      it "yields two pagination batches" do
        batches = []
        options = {
          :endpoint => "/institutions",
          :resource => "institutions"
        }
        subject.paginate_in_batches(options) { |b| batches << b }
        expect(batches.size).to eq(2)
        expect(batches.first.size).to eq(2)
        expect(batches.first.current_page).to eq(1)
        expect(batches.last.current_page).to eq(2)
        expect(batches.last.size).to eq(1)
      end
    end

    context "custom query params" do
      let(:query_params) { {:from_date => ::Date.new(2017, 10, 22)} }
      let(:total_pages) { 1 }

      it "uses the query params" do
        expect(::Atrium.client).to receive(:make_request).with(:get, "/weird_endpoint?from_date=2017-10-22&page=1&records_per_page=25").
                                     and_return(first_page_response).exactly(:twice)

        options = {
          :endpoint => "/weird_endpoint",
          :resource => "institutions",
          :query_params => query_params
        }

        subject.paginate_in_batches(options) { }
      end
    end
  end
end
