class ContactsController < ApplicationController
  def index
    if params[:list_id]
      @contacts = current_user.lists.find(params[:list_id]).contacts.paginate(:page => params['page'], :per_page => 20)
    else
      @contacts = current_user.contacts.paginate(:page => params['page'], :per_page => 20)
    end
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.user = current_user
    if @contact.save
      flash[:notice] = "Successfully created contact."
      redirect_to @contact
    else
      render :action => 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully updated contact."
      redirect_to @contact
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    redirect_to contacts_url
  end

  def alphabet
    @contacts = current_user.contacts.paginate(:page => params['page'], :per_page => 20,
      :conditions => "name LIKE '#{params[:letter]}%'")
    render :action => 'index'
  end
end
