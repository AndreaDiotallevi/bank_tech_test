require "transaction"

describe Transaction do
  let(:date) { double(:date) }
  let(:time_class) { double(:time_class, new: date) }
  let(:transaction) { Transaction.new(1000, 0, 1000, time_class) }

  describe "#format" do
    it "should return a formatted transaction" do
      allow(date).to receive(:strftime).with("%d/%m/%Y").and_return "10/01/2012"
      expect(transaction.format).to eq "10/01/2012 || 1000.00 || || 1000.00"
    end
  end
end
