require "transaction"

describe Transaction do
  let(:transaction) { Transaction.new(Date.today, 1000, 0, 1000) }

  describe "#format" do
    it "should return a nice formatted transaction" do
      allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
      expect(transaction.format).to eq "10/01/2012 || 1000.00 || || 1000.00"
    end
  end
end
