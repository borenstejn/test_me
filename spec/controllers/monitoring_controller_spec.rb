require 'spec_helper'
require 'rails_helper'
require 'pry'

RSpec.describe MonitoringController, type: :controller do
  describe "GET #balance_check_count" do
    before(:each) do
      @user = User.create(name: 'jerome')
      @flurbo = Flurbo.create(user: @user, balance: 10_000_00)
    end

    it 'adds 1 to balance check count after going to the flurbos#show endpoint' do
      get :balance_check_count, params: {user_id: @user.id}
      expect(response.code).to eq('200')
      expect(response.body).to eq('0')

      @controller = FlurbosController.new
      get :show, params: {user_id: @user.id}

      @controller = MonitoringController.new
      get :balance_check_count, params: {user_id: @user.id}
      expect(response.code).to eq('200')
      expect(response.body).to eq('1')
    end

    it 'does not return visits older than 1 week or with a different endpoint' do
      TrackerEvent.create(user: @user, endpoint: 'flurbos#show', created_at: Time.current - 1.day)
      TrackerEvent.create(user: @user, endpoint: 'transaction#create', created_at: Time.current - 1.day)
      TrackerEvent.create(user: @user, endpoint: 'flurbos#show', created_at: Time.current - 8.days)
      get :balance_check_count, params: {user_id: @user.id}
      expect(response.code).to eq('200')
      expect(response.body).to eq('1')

      @controller = FlurbosController.new
      get :show, params: {user_id: @user.id}

      @controller = MonitoringController.new
      get :balance_check_count, params: {user_id: @user.id}
      expect(response.code).to eq('200')
      expect(response.body).to eq('2')
    end

  end
end