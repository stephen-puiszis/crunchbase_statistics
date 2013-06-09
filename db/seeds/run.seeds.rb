# In new file:
# Industry.destroy_all
# Company.destroy_all
# Individual.destroy_all
# Financial.destroy_all
# Investment.destroy_all
# Funding.destroy_all
# Location.destroy_all

  run_number = 0
  number_of_queries = 1000
# bundle install other macs
# ____________________________________________________________

require 'open-uri'
require 'json'
require 'date'

start_time = Time.now
puts start_time

base_url = "http://api.crunchbase.com/v/1/"
key = "atsvjzz7q9apzywd9ex3t67e"
api_key = "&api_key=#{key}"

# Lists
cos = "companies.js?"
peoples = "people.js?"
fins = "financial-organizations.js?"

# Show Pages
co = "company/"
fin = "financial-organization/"
person = "person/"


# -------------------------------- Company Seeding --------------------------------- #

companies = Company.offset(run_number * number_of_queries).limit(number_of_queries)
companies.each_index do |i|
      puts "Company #{i}"
  # error 1)
    begin
    company_data = JSON.parse(open(base_url+co+companies[i].perma+".js?"+api_key).read)
    unless Company.find_by_perma(company_data["permalink"]) == nil
      c = Company.find_by_perma(company_data["permalink"])

      if company_data["category_code"] == nil
        c.industry_id = Industry.first.id
      elsif Industry.find_by_name(company_data["category_code"]) == nil
        Industry.create(name: company_data["category_code"])
        c.industry_id = Industry.find_by_name(company_data["category_code"]).id
      else
        c.industry_id = Industry.find_by_name(company_data["category_code"]).id
      end

      l = Location.new
      if company_data['offices'][0].present?
        l.address1 = company_data['offices'][0]['address1']
        l.address2 = company_data['offices'][0]['address12']
        l.zipcode = company_data['offices'][0]['zip_code']
        l.city = company_data['offices'][0]['city']
        l.statecode = company_data['offices'][0]['state_code']
        l.countrycode = company_data['offices'][0]['country_code']
        if company_data['offices'][0]['latitude'].present?
          l.latitude = company_data['offices'][0]['latitude']
          l.longitude = company_data['offices'][0]['longitude']
        end
      end
      l.company_id = c.id
      l.save




  # -------------- Company Funding Rounds -------------- #


      company_data["funding_rounds"].each do |round|
        f = Funding.new
        f.company_id = c.id


        if round["round_code"] == "unattributed"
          f.funding_code = "venture round"
        else
          f.funding_code = round["round_code"]
        end

        if round["raised_amount"] != nil
          f.funding_amount = round["raised_amount"]
        else
          f.funding_amount = nil
        end

        if round["raised_currency_code"] != nil
          f.funding_currency = round["raised_currency_code"]
        else
          f.funding_currency = nil
        end

        if round["funded_year"] == nil
            f.funding_date = nil
          elsif round["funded_month"] == nil
            f.funding_date = Date.new( round["funded_year"] )
          elsif round["funded_day"] == nil
            f.funding_date = Date.new( round["funded_year"], round["funded_month"])
          else
            f.funding_date = Date.new(round["funded_year"], round["funded_month"], round["funded_day"])
        end

        f.save


  # ------------------Investments

  # WAT KUNNEN WE HIER MEE?!
        if round["investments"].empty?
          i = Investment.new
          i.funding_id = f.id
          i.save
        end

        round["investments"].each do |investment|

        if investment["company"] != nil
          unless Company.find_by_perma(investment["company"]["permalink"]) == nil
            company = Company.find_by_perma(investment["company"]["permalink"])
            company.investments.create(funding_id: f.id)
          end
        elsif investment["financial_org"] != nil
          unless Financial.find_by_perma(investment["financial_org"]["permalink"]) == nil
            financial = Financial.find_by_perma(investment["financial_org"]["permalink"])
            financial.investments.create(funding_id: f.id)

            i = Investment.new
            i.funding_id = f.id
            i.investable_id = Financial.find_by_perma(investment["financial_org"]["permalink"]).id
            i.investable_type="financial"
            i.save
          end
          elsif investment["person"] != nil
            unless Individual.find_by_perma(investment["person"]["permalink"]) == nil
            individual = Individual.find_by_perma(investment["person"]["permalink"])
            individual.investments.create(funding_id: f.id)

            i = Investment.new
            i.funding_id = f.id
            i.investable_id = Individual.find_by_perma(investment["person"]["permalink"]).id
            i.investable_type="individual"
            i.save
            end
          else

            i = Investment.new
            i.funding_id = f.id
            i.investable_id = nil
            i.save
          end

        end

      end

      if company_data["ipo"] != nil

        f = Funding.new
        f.company_id = c.id
        f.funding_code = 'ipo'
        f.funding_amount = company_data["ipo"]["valuation_amount"]
        f.funding_currency = company_data["ipo"]["valuation_currency_code"]


      if company_data["ipo"]["pub_year"] == nil
        f.funding_date = nil
      elsif company_data["ipo"]["pub_month"] == nil
        f.funding_date = Date.new(company_data["ipo"]["pub_year"])
      elsif company_data["ipo"]["pub_day"] == nil
        f.funding_date = Date.new(company_data["ipo"]["pub_year"], company_data["ipo"]["pub_month"])
      else
        f.funding_date = Date.new(company_data["ipo"]["pub_year"], company_data["ipo"]["pub_month"], company_data["ipo"]["pub_day"] )
      end

      f.save

      end
    end
  rescue
    puts "---------------#{i} failed"
    end
end
end_time = Time.now
puts "It took #{end_time - start_time} seconds to run"
puts "There are #{Funding.all.count} funding rounds in this batch"


