require 'spec_helper'
require 'rails_helper'
require 'pry'

RSpec.describe TransactionsController, type: :controller do
  describe "POST #create" do
    before(:each) do
      @user = User.create(name: 'jerome')
      @flurbo = Flurbo.create(user: @user, balance: 1_000_00)
    end

    it 'creates if proper params' do
      expect do
        post :create, params: {user_id: @user.id, amount: 300_00}
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
      expect(response.code).to eq('200')
      expect(@flurbo.reload.balance).to eq(700_00)
      expect(JSON.parse(response.body).slice('amount', 'user_id'))
        .to  eq({'user_id' => @user.id, 'amount' => 300_00})
    end

    it 'returns an error if the flurbo balance is insufficient' do
      expect do
        post :create, params: {user_id: @user.id, amount: 1_000_00}
      end.to change { ActionMailer::Base.deliveries.count }.by(0)
      expect(@flurbo.reload.balance).to eq(1_000_00)
      expect(response.code).to eq('403')
    end
  end
end