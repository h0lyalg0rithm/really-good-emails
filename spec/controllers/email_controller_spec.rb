require 'rails_helper'

RSpec.describe EmailController, :type => :controller do
  it "should save emails" do
    post :receiver, {test: "test"}
    expect(Email.count).to eq 1
  end
end
