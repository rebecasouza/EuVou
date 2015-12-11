require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #finisn_signup" do
    it "returns http success" do
      get :finisn_signup
      expect(response).to have_http_status(:success)
    end
  end

end
