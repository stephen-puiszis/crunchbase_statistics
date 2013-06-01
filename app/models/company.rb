class Company < ActiveRecord::Base
  attr_accessible :crunch_url, :dead_date, :founded_date, :home_url, :industry_id, :name, :perma, :stock_symbol

  belongs_to :industry
  has_many :fundings
  has_many :investments, :as => :investable
  has_one :location

end
