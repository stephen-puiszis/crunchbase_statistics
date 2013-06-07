class Financial < ActiveRecord::Base
  attr_accessible :crunch_url, :founded_date, :home_url, :name, :perma

  has_many :investments, :as => :investable

  def investment_sum
    Funding.for_financial(self.id).sum(:funding_amount)
  end

  def investment_count
    Funding.for_financial(self.id).count
  end

    def num_of_investments
      Funding.for_financial(self.id).count
    end

end
