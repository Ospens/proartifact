# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TierListsController, type: :controller do
  let!(:tier_list) { create :tier_list }
  let!(:tier_list_group) { create :tier_list_group, tier_list: tier_list }

  describe 'GET #show' do
    it 'return tier_list' do
      get :show, params: { id: tier_list.id }
      expect(assigns(:tl_groups).length).to eq(1)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
end
