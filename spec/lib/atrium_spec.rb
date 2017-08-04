require "spec_helper"

RSpec.describe Atrium do
  it "has a client" do
    expect(described_class).to respond_to(:client)
  end

  describe ".configure" do
    it "yields an Atrium::Client" do
      expect { |block| described_class.configure(&block) }.to yield_with_args(Atrium::Client)
    end
  end
end
