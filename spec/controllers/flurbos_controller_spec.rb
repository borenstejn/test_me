require 'spec_helper'
require 'rails_helper'
require 'pry'

RSpec.describe FlurbosController, type: :controller do
  describe "GET #show" do
    before(:each) do
      @user = User.create(name: 'jerome')
    end

    it 'renders the flurbo' do
      Flurbo.create(user: @user, balance: 1_000_00)
      get :show, params: {user_id: @user.id}
      expect(response.code).to eq('200')
      expect(JSON.parse(response.body)['balance']).to eq(1_000_00)
    end

    it "returns 204 if the user don't have a flurbo" do
      get :show, params: {user_id:  User.create(name: 'paul').id}
      expect(response.code).to eq('204')
    end
  end
end