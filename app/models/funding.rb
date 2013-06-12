class Funding < ActiveRecord::Base
  attr_accessible :company_id, :funding_amount, :funding_code, :funding_currency, :funding_date

  belongs_to :company

  has_many :investments
  has_one :location, through: :company

  scope :for_financial, lambda { |financial_id| includes(:investments).where('investments.investable_id = ? AND investments.investable_type = ?', financial_id, 'Financial') if financial_id }
  # Funding.for_financial(financial_id)
  scope :for_company, lambda { |company_id| includes(:investments).where('investments.investable_id = ? AND investments.investable_type = ?', company_id, 'Company') if company_id }
  # Funding.for_company(company_id)
  scope :for_individual, lambda { |individual_id| includes(:investments).where('investments.investable_id = ? AND investments.investable_type = ?', individual_id, 'Individual') if individual_id }
  # Funding.for_individual(company_id)
  scope :for_funding_round, lambda { |funding_code| where('funding_code = ?', funding_code) if funding_code }
  # Funding.for_funding_round(funding_code)
  scope :for_industry, lambda { |industry_id| includes(:company).where('companies.industry_id = ?', industry_id, ) if industry_id }
  # Funding.for_industry(industry_id)

  # Location Based
  # scope :for_state, lambda { |statecode| includes(:company).where('companies.location.statecode LIKE ?', statecode ) if statecode }

  #TODO  - make it the surrounding 100 miles
  scope :for_city, lambda { |city| includes(:location).where('locations.city LIKE ?', "%#{city}%" ) if city }
  # scope :for_location, lambda { |location| includes(:company).where('location.city LIKE ? OR location.zipcode ? LIKE ? OR location.statecode LIKE ? OR location.countrycode LIKE ?', location, location, location, location ) if location }



  def perma
    company.perma
  end

  def self.multiple_funding_codes(round, round2)
    Funding.where('funding_code = ? or funding_code = ?', round, round2 )
  end

  ####-------------- Date Related -----------------####
  def self.ltm_fundings(days = 90)
    today = Time.now
    period = today - (60*60*24*days) #need to improve logic
    Funding.where('funding_date >= ? and funding_date <= ?', period, today)
  end

  def self.annual_fundings(year)
    start_date = Date.new(year)
    end_date = Date.new (year + 1)
    Funding.where('funding_date >= ? and funding_date < ?', start_date, end_date) #Need to determine if everything is inclusive of the end date or not
  end

  def self.monthly_fundings(date_var)
    start_date = Date.new(date_var.year, date_var.month) # Returns First day of the month
    end_date = Date.new(date_var.next_month.year, date_var.next_month.month) # Returns Midnight of the next month's first day
    Funding.where('funding_date >= ? and funding_date < ?', start_date, end_date) #Need to determine if everything is inclusive of the end date or not
  end


  def self.quarterly_fundings(year, quarter)
      if quarter == 'q1'
       start_date = Date.new(year)
       end_date = Date.new(year, 3, 31)
      elsif quarter == 'q2'
        start_date = Date.new(year, 4)
        end_date = Date.new(year, 6, 30)
      elsif quarter == 'q3'
        start_date = Date.new(year, 7)
        end_date = Date.new(year, 9, 30)
      elsif quarter == 'q4'
        start_date = Date.new(year, 10)
        end_date = Date.new(year, 12, 31)
      else
        return nil
      end
     Funding.where('funding_date >= ? and funding_date < ?', start_date, end_date) #Need to determine if everything is inclusive of the end date or not
  end

end
