class Company < ActiveRecord::Base
  attr_accessible :crunch_url, :dead_date, :founded_date, :home_url, :industry_id, :name, :perma, :stock_symbol

  belongs_to :industry
  has_many :fundings
  has_many :investments, :as => :investable
  has_one :location
  def total_investments
    total=0
    Funding.for_company(self.id).each do |f|
      next unless f.present? && f.funding_amount.present?
      total+=f.funding_amount
    end
    return total
  end

  def investment_sum
    Funding.for_company(self.id).sum(:funding_amount)
  end

  def investment_count
    Funding.for_company(self.id).count
  end


end
