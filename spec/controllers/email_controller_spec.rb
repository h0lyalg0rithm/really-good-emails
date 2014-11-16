require 'rails_helper'

RSpec.describe EmailController, :type => :controller do
  before do
    @html = File.open Rails.root.join('spec','fixtures','email1.html')
  end
  it "should save emails" do
    post :receiver, {test: "test"}
    expect(Email.count).to eq 1
  end

  it "saves the email content" do
    post :receiver, { 'body-html' => @html.to_s }
    expect(Email.first.html).to eq @html.to_s
  end
end
