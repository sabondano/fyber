class OffersController < ApplicationController
  def show
    @offers = Offer.find(params)
  end
end
