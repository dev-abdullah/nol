class Api::V1::CardsController < ApplicationController
  skip_before_action :require_login
  before_action :set_card

  def show
    render json: { card: @card, status: :success }
  end

  def update
    card = @card.update(card_params)
    if card.valid?
      render json: {
        status: :success,
        card: card
      }
    else
      render json: {
        status: :not_acceptable,
        errors: card.errors.full_messages
      }
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:balance)
  end
end
