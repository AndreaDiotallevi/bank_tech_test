require "statement"

describe Statement do
  let(:transaction) { double(:transaction) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:statement) { Statement.new(transaction_class) }

  describe "#add_transaction" do
    it "should return all transactions" do
      expect(statement.add_transaction(Date.today, 1000, 0, 1000)).to eq [transaction]
    end
  end
end
