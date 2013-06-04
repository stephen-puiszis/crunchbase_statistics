class Funding < ActiveRecord::Base
  attr_accessible :company_id, :funding_amount, :funding_code, :funding_currency, :funding_date

  belongs_to :company
  has_many :investments

  scope :for_financial, lambda { |financial_id| includes(:investments).where('investments.investable_id = ? AND investments.investable_type = ?', financial_id, 'Financial') if financial_id }
  scope :for_company, lambda { |company_id| includes(:investments).where('investments.investable_id = ? AND investments.investable_type = ?', company_id, 'Company') if company_id }
  scope :for_individual, lambda { |individual_id| includes(:investments).where('investments.investable_id = ? AND investments.investable_type = ?', individual_id, 'Individual') if individual_id }
  # Funding.for_financial(financial_id)

  # TODO: add_index :table_name, :foreign_key

  def perma
    company.perma
  end

  #need to talk about the best way to write this so it goes fast and that I can then do multiple calculations on each
  #I'd prefer not to write each one a million times but its not the end of the world

  ####-------------- Date Related -----------------####

  def self.ltm_fundings(days = 90)
    today = Time.now
    period = today - (60*60*24*days) #need to improve logic
    Funding.find(:all, :conditions => ['funding_date >= ? and funding_date <= ?', period, today])
  end

  def self.annual_fundings(year)
    start_date = Date.new(year)
    end_date = Date.new (year + 1)
    Funding.find(:all, :conditions => ['funding_date >= ? and funding_date < ?', start_date, end_date]) #Need to determine if everything is inclusive of the end date or not
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
     Funding.find(:all, :conditions => ['funding_date >= ? and funding_date < ?', start_date, end_date]) #Need to determine if everything is inclusive of the end date or not
  end


  #### Round Related ####
  def self.round_fundings(round_code)
    Funding.find(:all, :conditions => ['funding_code = ?', round_code])
  end

  def self.ltm_round_fundings(days, round_code)
    end_date = Time.now
    start_date = end_date - (60*60*24*days)
    Funding.find(:all, :conditions => ['funding_date >= ? and funding_date <= ? and funding_code = ?', start_date, end_date, round_code])
  end


end
