class OffersController < ApplicationController
  def show
    Offer.find(params)
  end
end
