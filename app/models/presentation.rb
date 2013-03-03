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
        output += "\n</div>\n</div>"
      end
      first = false if first

      output += "<div class=\"slide\">\n" + h1
      output
    end
    html.gsub!(/<\/h1>/) do |h1close|
      h1close + "<div class=\"slide-body\">"
    end
    #puts "BODY:\n #{body} #{body.class}"
    html + '</div></div>'
  end
end
