require 'spec_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:users) { 10.times.collect create(:user) }

  describe "GET show" do
    it "assigns the current user to @user" do
      get :show, id: user.id
      expect(assigns(:user)).to_not be_nil
    end
  end

  describe "GET index" do
    it "assigns all users to @users" do
      get :index
      expect(assigns(:users)).to_not be_nil
    end
  end

end
