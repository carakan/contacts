require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Users.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Users.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Users.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to users_url(assigns(:users))
  end
  
  def test_edit
    get :edit, :id => Users.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Users.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Users.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Users.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Users.first
    assert_redirected_to users_url(assigns(:users))
  end
  
  def test_destroy
    users = Users.first
    delete :destroy, :id => users
    assert_redirected_to users_url
    assert !Users.exists?(users.id)
  end
end
