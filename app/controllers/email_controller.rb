class EmailController < ApplicationController
  def receiver
    @email = clean_email params['body-html']
    @cat = Email.create html: @email, name: params['From']
    render nothing: true
  end
  def index
    @emails = Email.all
  end
  def show
    @email = Email.find(params[:id])
    render inline: @email.html
  end
  private
  def clean_email data
    noko = Nokogiri::HTML(data)
    # noko.remove_forward.remove_links
    noko.to_html
  end
  def remove_forward
    self.css('div')[0]
  end
  def remove_links
    self.css('a').each do |a|
      a.attributes['href'].value = ""
    end
    self
  end
end
