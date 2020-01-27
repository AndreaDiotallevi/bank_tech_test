class Transaction
  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def format
    credit = @credit.zero? ? "" : format_decimals(@credit)
    debit = @debit.zero? ? "" : format_decimals(@debit)
    balance = format_decimals(@balance)
    [format_date, credit, debit, balance].join(" || ").gsub("  ", " ")
  end

  private

  def format_date
    @date.strftime("%d/%m/%Y")
  end

  def format_decimals(amount)
    sprintf('%.2f', amount)
  end
end
