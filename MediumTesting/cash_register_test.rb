require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  def test_accept_money
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
    @transaction.amount_paid = 100

    @register.accept_money(@transaction)
    assert_equal(1100, @register.total_money)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    transaction.amount_paid = 150

    assert_equal(50, register.change(transaction))
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    transaction.amount_paid = 150

    expected_output = "You've paid $100.\n"

    assert_output(expected_output) {register.give_receipt(transaction)}
  end
end