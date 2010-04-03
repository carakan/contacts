class PhonesController < ApplicationController
  def index
    @phones = Phone.all
  end
  
  def show
    @phone = Phone.find(params[:id])
  end
  
  def new
    @phone = Phone.new
  end
  
  def create
    @phone = Phone.new(params[:phone])
    if @phone.save
      flash[:notice] = "Successfully created phone."
      redirect_to @phone
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
      redirect_to @phone
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy
    flash[:notice] = "Successfully destroyed phone."
    redirect_to phones_url
  end
end
