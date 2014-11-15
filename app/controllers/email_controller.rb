class EmailController < ApplicationController
  def receiver
    @cat = Email.create html: params['body-html']
    render nothing: true
  end
end
