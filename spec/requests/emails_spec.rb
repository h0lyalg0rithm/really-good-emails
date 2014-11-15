require 'rails_helper'

RSpec.describe "Emails", :type => :request do
  describe "POST /email/receiver" do
    it "works!" do
      post email_receiver_path
      expect(response).to have_http_status(200)
    end
  end
end
