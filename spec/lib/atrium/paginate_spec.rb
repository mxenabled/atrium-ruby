require "spec_helper"

RSpec.describe ::Atrium::Paginate do
  include_context "configure"

  let(:test_class) { ::Atrium::Institution }

  describe "paginate_endpoint" do
    context "with query_params" do
      let(:expected_response) do
        institutions_response["institutions"].map { |institution| ::Atrium::Institution.new(institution) }
      end
      let(:institutions_response) do
        {
          "institutions" =>
            [
              { "code" => "batman", "name" => "Batman Bank", "url" => "https://batman.com/" },
              { "code" => "batman", "name" => "Batman CC", "url" => "None" },
              { "code" => "batman", "name" => "Batman WBC", "url" => "https://www.batman.com" }
            ],
          "pagination" =>
              {
                "current_page" => 1, "per_page" => 25, "total_entries" => 3, "total_pages" => 1
              }
        }
      end
      let(:query_params) { { "name" => "batman" } }

      before do
        allow(::Atrium.client).to receive(:make_request).and_return(institutions_response)
      end

      it "should return list from test params" do
        paginated_results = test_class.paginate_endpoint(:query_params => query_params)
        expect(paginated_results).to eq(expected_response)
      end
    end

    context "without query_params" do
      let(:expected_response) do
        {
          "institutions" =>
            [
              institution_attributes,
              institution_attributes,
              institution_attributes,
              institution_attributes
            ]
        }.merge(pagination)
      end
      let(:expected_result) do
        expected_response["institutions"].map { |institution| ::Atrium::Institution.new(institution) }
      end
      let(:institution_attributes) do
        {
          "code" => "batman",
          "name" => "Batman Bank",
          "url" => "https://www.batman.com"
        }
      end
      let(:institutions_response) { { "institutions" => [institution_attributes, institution_attributes] }.merge(pagination) }
      let(:pagination) do
        {
          "pagination" =>
            {
              "current_page" => 1,
              "per_page" => 2,
              "total_entries" => 4,
              "total_pages" => 2
            }
        }
      end
      before do
        allow(::Atrium.client).to receive(:make_request).and_return(institutions_response)
      end

      it "will return paginated list of results" do
        paginated_results = test_class.paginate_endpoint

        expect(paginated_results.length).to eq(4)
        expect(paginated_results).to eq(expected_result)
      end
    end
  end

  describe "#paginate_endpoint_in_batches" do
    context "no block passed" do
      let(:response_message) { "method requires block to be passed" }
      it "should return message that block is required" do
        response = test_class.paginate_endpoint_in_batches
        expect(response).to eq(response_message)
      end
    end

    context "block passed" do
      let(:batch_of_institutions) do
        institutions_response["institutions"].map do |institution|
          ::Atrium::Institution.new(institution)
        end
      end
      let(:institutions_response) do
        {
          "institutions" =>
            [
              { "code" => "batman", "name" => "Batman Bank", "url" => "https://batman.com/" },
              { "code" => "batman", "name" => "Batman CC", "url" => "None" },
              { "code" => "batman", "name" => "Batman WB", "url" => "https://www.batman.com" }
            ],
          "pagination" =>
              {
                "current_page" => 1, "per_page" => 25, "total_entries" => 3, "total_pages" => 1
              }
        }
      end
      let(:list_from_batch) { [] }

      before do
        allow(::Atrium.client).to receive(:make_request).and_return(institutions_response)
      end

      it "should pass batches to block" do
        test_class.list_in_batches { |list| list_from_batch << list }

        expect(list_from_batch.first.size).to eq(3)
        expect(list_from_batch.first).to eq(batch_of_institutions)
      end
    end
  end
end
