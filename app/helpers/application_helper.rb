module ApplicationHelper

  def format_mil(num)
    unless num == nil
     return number_to_currency(num / 1_000_000, :unit => "$", :precision => 1)
    else
      number_to_currency(0, :unit => "$", :precision => 1)
    end
  end

end
