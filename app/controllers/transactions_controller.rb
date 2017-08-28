class TransactionsController < ApplicationController
  include Transactions::RequestSender

  def create
    RequestSender.new({}).make_request
  end

  def update
    RequestSender.new({}).make_request
  end

  private

  def transaction_params
    params.fetch(:transaction).permit
  end
end
