class Presentation < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  belongs_to :user

  # Wraps in slide divs every time a first-level header occurs
  def render_presentation
    html = RDiscount.new(body).to_html

    first = true
    html.gsub!(/<h1>/) do |h1|
      output = ''
      unless first
        output += "\n</div>\n"
      end
      first = false if first

      output += "<div class=\"slide\">\n" + h1
      output
    end
    #puts "BODY:\n #{body} #{body.class}"
    html + '</div>'
  end
end
