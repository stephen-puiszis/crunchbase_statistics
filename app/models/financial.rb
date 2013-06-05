class Financial < ActiveRecord::Base
  attr_accessible :crunch_url, :founded_date, :home_url, :name, :perma

  has_many :investments, :as => :investable

  def investments_detail
    Investment.all(:joins => :funding)
  end

  def total_investments
    total=0
    Funding.for_financial(self.id).each do |f|
      next unless f.present? && f.funding_amount.present?
      total+=f.funding_amount
    end
    return total
  end

end
