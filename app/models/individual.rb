class Individual < ActiveRecord::Base
  attr_accessible :crunch_url, :home_url, :name, :perma

  has_many :investments, :as => :investable


  def investment_sum
    Funding.for_individual(self.id).sum(:funding_amount)
  end

  def investment_count
    Funding.for_individual(self.id).count
  end
end
