require 'rails_helper'

describe ApplicationController do
  controller do
    def index
      render text: current_user.email
    end
  end

  describe "#current_user" do
    it "creates a user if one does not exist" do
      email = "dprior@mit.edu"
      request.env["eppn"] = email

      get :index

      expect(User.find_by(email: email)).to be_a User
      expect(response.body).to eq email
    end

    it "uses existing user if one already exists" do
      user = create(:user)
      request.env["eppn"] = user.email

      get :index

      expect(User.where(email: user.email).count).to eq 1
      expect(response.body).to eq user.email
    end
  end
end
