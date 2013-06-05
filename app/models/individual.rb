class Individual < ActiveRecord::Base
  attr_accessible :crunch_url, :home_url, :name, :perma

  has_many :investments, :as => :investable

    def total_investments
    total=0
    Funding.for_individual(self.id).each do |f|
      next unless f.present? && f.funding_amount.present?
      total+=f.funding_amount
    end
    return total
  end
end
