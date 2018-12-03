require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do
  let(:create_tournament) { create(:tournament) }

  describe "GET #index" do
    it "Redirect to the index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "With valid attributes" do
      it "Redirect to the tournament/index" do
        post :create, params: {tournament: attributes_for(:tournament)}
        expect(response).to have_http_status(:redirect)
      end

      it "Save data in database" do
        expect{
          post :create, params: {tournament: attributes_for(:tournament)}
        }.to change(Tournament, :count).by(1)
      end
    end
  end
  

  describe "GET #new" do
    context "With valid attributes" do
      it "Redirect to the tournament/new" do
        get :new, params: {tournament: attributes_for(:tournament)}
        expect(response).to have_http_status(:success)
      end

      it "Render the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: create_tournament } }
    
    it "assigns the requested tournament to @tournaments" do
      expect(assigns(:tournament)).to eq (create_tournament)
    end

    it "renders the :edit template" do 
      expect(response).to render_template :edit
    end
  end


  describe "DELETE #destroy" do
    let!(:destroy_tournament) { create(:tournament)}

    it "Delete tournament" do
      expect{
        delete :destroy, params: { id: destroy_tournament }
      }.to change(Tournament, :count).by(-1)
    end

    it "redirect to tournament#index" do
      delete :destroy, params: { id: destroy_tournament}
      expect(response).to redirect_to tournaments_path
    end 
  end


  describe "GET #update" do
    before { patch :update, params: {id: create_tournament, tournament: attributes_for(:tournament)} }
      
    it "locates the requested @tournament" do
      expect(assigns(:tournament)).to eq (create_tournament) 
    end

    it "changes user's attributes" do
      create_tournament.reload
      expect(create_tournament.name).to eq('Surf')
      expect(create_tournament.place).to eq('Koombea')
    end

    it "Redirect to the updated tournament" do
      expect(response).to redirect_to (create_tournament)
    end
  end


  describe "GET #show" do
    before { get :show, params: { id: create_tournament } }

    it "assigns the requested tournament to @tournaments" do
      expect(assigns(:tournament)).to eq (create_tournament)
    end
    
    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end
end