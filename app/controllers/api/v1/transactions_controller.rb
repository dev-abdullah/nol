class Api::V1::TransactionsController < ApplicationController
  skip_before_action :require_login

  def index
    transactions = Transaction.withdraw.where(card_id: params[:card_id])
    render json: transactions
  end

  def create
    transaction = TransactionCreator.new(params).create
    if transaction.valid?
      render json: {
        status: :success,
        transaction: transaction
      }
    else
      render json: {
        status: :not_acceptable,
        errors: transaction.errors.full_messages
      }
    end
  end
end
