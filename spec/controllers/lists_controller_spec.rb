require File.dirname(__FILE__) + '/../spec_helper'
 
describe ListsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => List.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    List.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    List.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(list_url(assigns[:list]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => List.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    List.any_instance.stubs(:valid?).returns(false)
    put :update, :id => List.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    List.any_instance.stubs(:valid?).returns(true)
    put :update, :id => List.first
    response.should redirect_to(list_url(assigns[:list]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    list = List.first
    delete :destroy, :id => list
    response.should redirect_to(lists_url)
    List.exists?(list.id).should be_false
  end
end
