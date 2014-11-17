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
    noko = remove_forward noko
    noko = remove_links noko
    noko.to_html
  end
  def remove_forward noko
    noko.css('div')[0] 
  end
  def remove_links noko
    noko.css('a').each do |a|
      a.attributes['href'].value = ""
    end
    noko
  end
end
