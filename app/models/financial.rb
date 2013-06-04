class Financial < ActiveRecord::Base
  attr_accessible :crunch_url, :founded_date, :home_url, :name, :perma

  has_many :investments, :as => :investable

  def investments_detail
    Investment.all(:joins => :funding)
  end

end
