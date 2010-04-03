class PhonesController < ApplicationController
  def index
    bussiness_card = current_user.bussiness_cards.find(params[:b_card_id])
    @phones = bussiness_card.phones.paginate(:page => params['page'], :per_page => 20)
  end
  
  def show
    @phone = Phone.find(params[:id])
  end
  
  def new
    @phone = Phone.new
  end
  
  def create
    @phone = Phone.new(params[:phone])
    @phone.bussiness_card = BCard.find(params[:b_card_id])
    if @phone.save
      flash[:notice] = "Successfully created phone."
      redirect_to b_card_phones_url(params[:b_card_id])
    else
      render :action => 'new'
    end
  end
  
  def edit
    @phone = Phone.find(params[:id])
  end
  
  def update
    @phone = Phone.find(params[:id])
    if @phone.update_attributes(params[:phone])
      flash[:notice] = "Successfully updated phone."
      redirect_to b_card_phone_path(params[:b_card_id], @phone)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy
    flash[:notice] = "Successfully destroyed phone."
    redirect_to b_card_phones_url(params[:b_card_id])
  end
end
