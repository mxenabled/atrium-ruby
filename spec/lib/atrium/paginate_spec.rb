require "spec_helper"

describe "::Atrium::Paginate" do
  let(:test_class) { ::Atrium::Institution }

  describe "paginate_endpoint" do
    context "with query_params" do
      let(:expected_response) {
        institutions_response["institutions"].map { |institution| ::Atrium::Institution.new(institution) }
      }
      let(:institutions_response) {
        {
          "institutions" =>
            [
              {"code" => "chase", "name" => "Chase Bank", "url" => "https://chase.com/"},
              {"code" => "68944", "name" => "Chase Credit Cards", "url" => "None"},
              {"code" => "68702", "name" => "INTBG OFX CHASE CARD INST", "url" => "https://www.chase.com"}
            ],
            "pagination" =>
              {
                "current_page" => 1, "per_page" => 25, "total_entries" => 3, "total_pages" => 1
              }
          }
      }
      let(:query_params) { { :name => "chase" } }

      before do
        allow(::Atrium.client).to receive(:make_request).and_return(institutions_response)
      end

      it "should return list from test params" do
        paginated_results = test_class.paginate_endpoint(query_params)
        expect(paginated_results).to eq(expected_response)
      end
    end

    context "without query_params" do
      let(:expected_response) {
        {
          "institutions" =>
            [
              institution_attributes,
              institution_attributes,
              institution_attributes,
              institution_attributes
            ] }.merge(pagination)
      }
      let(:expected_result) {
        expected_response["institutions"].map { |institution| ::Atrium::Institution.new(institution) }
      }
      let(:institution_attributes) do
        {
          "code" => "chase",
          "name" => "Chase Bank",
          "url" => "https://www.chase.com",
        }
      end
      let(:institutions_response) { { "institutions" => [institution_attributes, institution_attributes ] }.merge(pagination) }
      let(:pagination) {
        {
          "pagination" =>
            {
              "current_page" => 1,
              "per_page" => 2,
              "total_entries" => 4,
              "total_pages" => 2
            }
        }
      }
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
end
