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
    data = noko.to_html
    data = remove_forward data
    data = remove_links data
  end
  def remove_forward noko
    noko.css('div')[0]
    noko.to_html 
  end
  def remove_links noko
    noko.css('a').each do |a|
      a.attributes['href'].value = ""
    end
    noko.to_html
  end
end
