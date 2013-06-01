class Funding < ActiveRecord::Base
  attr_accessible :company_id, :funding_amount, :funding_code, :funding_currency, :funding_date

  belongs_to :company
  has_many :investments

  def perma
    company.perma
  end

  #### Date Related ####
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


  # Need to refactor this code for sure because this blows!!!!!!!!!
  def self.quarterly_fundings(year, quarter)

     def self.quarter_lookup(year, quarter)
      if quarter == 'q1'
        return Date.new(year, 3, 31)
      elsif quarter == 'q2'
        return Date.new(year, 6, 30)
      elsif quarter == 'q3'
        return Date.new(year, 9, 30)
      elsif quarter == 'q4'
        return Date.new(year, 12, 31)
      else
        return nil
      end
    end

    end_date = Funding.quarter_lookup(year, quarter)
    start_date = Date.new(year, quarter[1].to_i, 1)
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
