class EmailController < ApplicationController
  def receiver
    @email = remove_links params['body-html']
    @cat = Email.create html: @email
    render nothing: true
  end
  private
  def remove_links data
    noko = Nokogiri::HTML(data)
    noko.css('a').each do |a|
      a.attributes['href'].value = "#"
    end
    noko.to_html
  end
end
