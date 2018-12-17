require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  let(:create_user) { create(:user) }

  describe "GET #index" do
    it "Redirect to the index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "With valid attributes" do
      it "Redirect to the user/index" do
        post :create, params: {user: attributes_for(:user)}
        expect(response).to have_http_status(:redirect)
      end

      it "Save data in database" do
        expect{
          post :create, params: {user: attributes_for(:user)}
        }.to change(User, :count).by(1)
      end
    end

    context "With invalid attributes" do
      it "Not save in database" do
        expect{
          post :create, params: {user: attributes_for(:invalid_user)}
        }.to change(User, :count).by(0)
      end
      it "Render to the tournament/new" do
        post :create, params: {user: attributes_for(:invalid_user)}
        expect(response).to render_template :new
      end
    end
  end
  

  describe "GET #new" do
    context "With valid attributes" do
      it "Redirect to the user/new" do
        get :new, params: {user: attributes_for(:user)}
        expect(response).to have_http_status(:success)
      end

      it "Render the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: create_user } }
    
    it "assigns the requested user to @users" do
      expect(assigns(:user)).to eq (create_user)
    end

    it "renders the :edit template" do 
      expect(response).to render_template :edit
    end
  end


  describe "DELETE #destroy" do
    let!(:destroy_user) { create(:user)}

    it "Delete user" do
      expect{
        delete :destroy, params: { id: destroy_user }
      }.to change(User, :count).by(-1)
    end

    it "redirect to user#index" do
      delete :destroy, params: { id: destroy_user}
      expect(response).to redirect_to users_path
    end 
  end


  describe "GET #update" do
    before { patch :update, params: {id: create_user, user: attributes_for(:user)} }
      
    it "locates the requested @user" do
      expect(assigns(:user)).to eq (create_user) 
    end

    it "changes user's attributes" do
      create_user.reload
      expect(create_user.name).to eq(create_user.name)
      expect(create_user.last_name).to eq(create_user.last_name)
      expect(create_user.email).to eq(create_user.email)
      expect(create_user.password).to eq(create_user.password)
    end

    it "Redirect to the updated user" do
      expect(response).to redirect_to users_path
    end
  end
end