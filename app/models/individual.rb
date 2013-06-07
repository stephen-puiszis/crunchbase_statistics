class Individual < ActiveRecord::Base
  attr_accessible :crunch_url, :home_url, :name, :perma

  has_many :investments, :as => :investable


  def investment_sum
    Funding.for_individual(self.id).sum(:funding_amount)
  end

  def investment_count
    Funding.for_individual(self.id).count
  end


    def total_investments
    total=0
    Funding.for_individual(self.id).each do |f|
      next unless f.present? && f.funding_amount.present?
      total+=f.funding_amount
    end
    return total
    end

    def num_of_investments
      Funding.for_individual(self.id).count
    end

end
