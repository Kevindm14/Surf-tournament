require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  login_user
  let(:create_tournament) { create(:tournament)}
  let(:create_category) { create(:category) }
  let(:participants) { create_list(:participant,3)}
  let(:participants_ids) { participants.pluck(:id) }
  let!(:create_tournament_category) { create(:tournament_category, category: create_category, tournament: create_tournament)}

  it { should use_before_action(:set_category)}

  describe "GET #show" do
    before { get :show, params: {tournament_id: create_tournament.id, id: create_category.id} }  # /tournaments/:tournament_id/categories/:id

    it "assigns the requested category to @categories" do
      expect(assigns(:category)).to eq (create_category)
    end
    
    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  
  describe "GET #edit" do
    before { get :edit, params: { tournament_id: create_tournament.id, id: create_category } }
    
    it "assigns the requested category to @categories" do
      expect(assigns(:category)).to eq (create_category)
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "GET #update" do
    
    before { patch :update, params: { tournament_id: create_tournament.id, id: create_category.id, category: { participant_ids: participants_ids } }  }

    it "locates the requested @category" do
      expect(assigns(:category)).to eq(create_category)
    end

    it "changes categorie's attributes" do
      create_category.reload
      expect(create_category.name).to eq('LongBoard')
    end

    it "Redirect to the updated category" do
      expect(response).to redirect_to tournament_category_path
    end
  end
end