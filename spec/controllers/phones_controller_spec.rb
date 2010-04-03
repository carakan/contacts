require File.dirname(__FILE__) + '/../spec_helper'
 
describe PhonesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Phone.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Phone.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Phone.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(phone_url(assigns[:phone]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Phone.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Phone.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Phone.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Phone.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Phone.first
    response.should redirect_to(phone_url(assigns[:phone]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    phone = Phone.first
    delete :destroy, :id => phone
    response.should redirect_to(phones_url)
    Phone.exists?(phone.id).should be_false
  end
end
