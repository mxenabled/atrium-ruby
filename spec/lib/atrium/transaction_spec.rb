require "spec_helper"

describe ::Atrium::Transaction do
  let(:raw_transaction) { ::JSON.parse(raw_transaction_response) }
  let(:user_guid) { "USR-fa7537f3-48aa-a683-a02a-b18940482f54" }
  let(:transaction_guid) { "TRN-265abee9-889b-af6a-c69b-25157db2bdd9" }
	let(:raw_transaction_response) {
    %q(
      {
        "transaction": {
          "account_guid": "ACT-06d7f44b-caae-0f6e-1384-01f52e75dcb1",
          "amount": 61.11,
          "category": "Groceries",
          "check_number": null,
          "created_at": "2016-10-06T09:43:42+00:00",
          "date": "2013-09-23",
          "description": "Whole Foods",
          "guid": "TRN-265abee9-889b-af6a-c69b-25157db2bdd9",
          "is_bill_pay": false,
          "is_direct_deposit": false,
          "is_expense": true,
          "is_fee": false,
          "is_income": false,
          "is_overdraft_fee": false,
          "is_payroll_advance": false,
          "latitude": -43.2075,
          "longitude": 139.691706,
          "member_guid": "MBR-7c6f361b-e582-15b6-60c0-358f12466b4b",
          "memo": null,
          "merchant_category_code": 5411,
          "original_description": "WHOLEFDS TSQ 102",
          "posted_at": "2016-10-07T06:00:00+00:00",
          "status": "POSTED",
          "top_level_category": "Food & Dining",
          "transacted_at": "2016-10-06T13:00:00+00:00",
          "type": "DEBIT",
          "updated_at": "2016-10-07T05:49:12+00:00",
          "user_guid": "USR-fa7537f3-48aa-a683-a02a-b18940482f54"
        }
      }
    )
	}

	describe ".list" do
    it "gets a list of transactions"
	end

  describe ".read" do
    before { allow(::Atrium.client).to receive(:make_request).and_return(raw_transaction) }

    it "gets one transaction" do
      response = described_class.read(:user_guid => user_guid, :transaction_guid =>transaction_guid)

      expect(response).to be_kind_of(::Atrium::Transaction)
      expect(response.account_guid).to eq("ACT-06d7f44b-caae-0f6e-1384-01f52e75dcb1")
      expect(response.amount).to eq(61.11)
    end
  end
end
