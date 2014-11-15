class EmailController < ApplicationController
  def receiver
    @cat = Email.create html: params.to_s
    render nothing: true
  end
end
