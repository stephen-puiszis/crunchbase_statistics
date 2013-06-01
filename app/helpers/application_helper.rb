module ApplicationHelper

  def formatted_millions(number)
     return number_to_currency(number / 1_000_000, :unit => "$", :precision => 1)
   end

end
