class BCardsController < ApplicationController
  def index
    @b_cards = BCard.all
  end
  
  def show
    @b_card = BCard.find(params[:id])
  end
  
  def new
    @b_card = BCard.new
  end
  
  def create
    @b_card = BCard.new(params[:b_card])
    if @b_card.save
      flash[:notice] = "Successfully created bussiness card."
      redirect_to @b_card
    else
      render :action => 'new'
    end
  end
  
  def edit
    @b_card = BCard.find(params[:id])
  end
  
  def update
    @b_card = BCard.find(params[:id])
    if @b_card.update_attributes(params[:b_card])
      flash[:notice] = "Successfully updated b card."
      redirect_to @b_card
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @b_card = BCard.find(params[:id])
    @b_card.destroy
    flash[:notice] = "Successfully destroyed b card."
    redirect_to b_cards_url
  end
end
