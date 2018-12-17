require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  login_user
  let(:create_participant) { create(:participant) }

  it { should use_before_action(:set_participant)}

  describe "GET #index" do
    it "Redirect to the index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "With valid attributes" do
      it "Redirect to the participant/index" do
        post :create, params: {participant: attributes_for(:participant)}
        expect(response).to have_http_status(:redirect)
      end

      it "Save data in database" do
        expect{
          post :create, params: {participant: attributes_for(:participant)}
        }.to change(Participant, :count).by(1)
      end
    end

    context "With invalid attributes" do
      it "Not save in database" do
        expect{
          post :create, params: {participant: attributes_for(:invalid_participant)}
        }.to change(Participant, :count).by(0)
      end
      it "Render to the participant/new" do
        post :create, params: {participant: attributes_for(:invalid_participant)}
        expect(response).to render_template :new
      end
    end
  end
  

  describe "GET #new" do
    context "With valid attributes" do
      it "Redirect to the participant/new" do
        get :new, params: {participant: attributes_for(:participant)}
        expect(response).to have_http_status(:success)
      end

      it "Render the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: create_participant } }
    
    it "assigns the requested participant to @participants" do
      expect(assigns(:participant)).to eq (create_participant)
    end

    it "renders the :edit template" do 
      expect(response).to render_template :edit
    end
  end


  describe "DELETE #destroy" do
    let!(:destroy_participant) { create(:participant)}

    it "Delete participant" do
      expect{
        delete :destroy, params: { id: destroy_participant }
      }.to change(Participant, :count).by(-1)
    end

    it "redirect to tournament#index" do
      delete :destroy, params: { id: destroy_participant}
      expect(response).to redirect_to participants_path
    end 
  end


  describe "GET #update" do
    before { patch :update, params: {id: create_participant, participant: attributes_for(:participant)} }
      
    it "locates the requested @tournament" do
      expect(assigns(:participant)).to eq (create_participant) 
    end

    it "changes user's attributes" do
      create_participant.reload
      expect(create_participant.name).to eq('Jhon')
      expect(create_participant.last_name).to eq('Dhoe')
      expect(create_participant.gender).to eq('Male')
    end

    it "Redirect to the updated participant" do
      expect(response).to redirect_to participants_path
    end
  end
end