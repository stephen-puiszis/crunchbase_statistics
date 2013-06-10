
# ------------------------ Original Seed file
  run_number = 0
  number_of_queries = 2
# bundle install other macs


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


# # Company Permalinks
# companies =
# [
# 'facebook', 'twitter', 'tumblr', 'amazon', '37signals', 'salesforce', 'stripe',  'asana', 'google', 'zynga',
# 'path',  'tesla-motors', 'surveymonkey', 'linkedin', 'y-combinator', 'techstars', 'parse', 'airbnb', 'dropbox',
# 'pinterest', 'paypal', 'myspace', 'pixar', 'apple', 'airtime', 'uber-2', 'evernote', 'palantir-technologies', 'sunrise', 'handshake-2', 'wildfire-interactive', 'rocket-fuel', 'delphix', 'zalora'
# ]
# # Individual Permalinks
# individuals =
# [
# 'peter-thiel', 'dave-mcclure', 'kevin-rose', 'jack-dorsey', 'david-tisch', 'elon-musk', 'ron-conway', 'reid-hoffman', 'dave-morin', 'mark-pincus',
# 'max-levchin', 'steve-jobs', 'david-cohen', 'shawn-fanning', 'sean-parker', 'babak-nivi'
# ]
# # Venture Capital Permalinks
# vcs =
# [
# 'sv-angel', 'accel-partners', 'founders-fund', '500-startups',  'first-round-capital',
#  'andreessen-horowitz', 'sequoia-capital', 'greylock', 'benchmark-1', 'firstmark-capital',
#  'menlo-ventures', 'summit-partners'
# ]

Industry.destroy_all
Company.destroy_all
Individual.destroy_all
Financial.destroy_all
Investment.destroy_all
Funding.destroy_all
Location.destroy_all




# # --------------------------------------- Companies Seeding --------------------------------- #

# all_companies = JSON.parse(open(base_url + cos+ "page=25" + api_key).read)



# Industry.create(name: 'other')


# all_companies.each do |company|

#       c = Company.new
#       c.name = company["name"]
#       c.perma = company["permalink"]

#         if company["category_code"] == nil
#            c.industry_id = Industry.first.id

#         elsif Industry.find_by_name(company["category_code"]) == nil

#             Industry.create(name: company["category_code"])
#             c.industry_id = Industry.find_by_name(company["category_code"]).id

#         else
#             c.industry_id = Industry.find_by_name(company["category_code"]).id

#         end

#      c.save

# end

# puts "There are #{Company.all.count} Company database records"



# # --------------------------------------- Individuals Seeding --------------------------------- #

# all_people = JSON.parse(open(base_url + peoples + "page=25" + api_key).read)

# all_people.each do |person|

#   Individual.create(name: "#{person['first_name']} #{person['last_name']}", perma: person["permalink"])

# end

# puts "There are #{Individual.all.count} Individual database records"

# # # --------------------------------------- Financials Seeding --------------------------------- #

# all_financials = JSON.parse(open(base_url + fins + "page=25" + api_key).read)

# all_financials.each do |fin|

#   Financial.create(name: fin['name'], perma: fin["permalink"])

# end


# puts "There are #{Financial.all.count} Financial database records"





# # --------------------------------------- Individual Seeding --------------------------------- #
individuals = Individual.offset(run_number * number_of_queries).limit(number_of_queries)
# individuals.each_index do |j|

#     person_data = JSON.parse(open(base_url+person+individuals[j].perma+".js?"+api_key).read)

#     i = Individual.find_by_perma(person_data["permalink"])

#     i.crunch_url = person_data["crunchbase_url"]
#     i.home_url = person_data["homepage_url"]
#     i.save

# end

# puts "There are #{Individual.all.count} people in the database"

# # # --------------------------------------- Financial Org Seeding --------------------------------- #
# vcs = Financial.offset(run_number * number_of_queries).limit(number_of_queries)
# vcs.each_index do |i|

#     fin_data = JSON.parse(open(base_url+fin+vcs[i].perma+".js?"+api_key).read)

#     f = Financial.find_by_perma(fin_data["permalink"])

#     f.crunch_url = fin_data["crunchbase_url"]
#     f.home_url = fin_data["homepage_url"]

#     if (fin_data["founded_year"] == nil)
#       f.founded_date = nil
#     elsif (fin_data["founded_month"] == nil)
#       f.founded_date = Date.new(fin_data["founded_year"])
#     elsif (fin_data["founded_day"] == nil)
#       f.founded_date = Date.new(fin_data["founded_year"], fin_data["founded_month"])
#     else
#       f.founded_date = Date.new(fin_data["founded_year"], fin_data["founded_month"], fin_data["founded_day"])
#     end
#     f.save
# end

# puts "There are #{Financial.all.count} financials in the database"

# # # -------------------------------- Company Seeding --------------------------------- #

        #  companies = Company.offset(run_number * number_of_queries).limit(number_of_queries)
        # companies.each_index do |i|

# error 1)
        #       company_data = JSON.parse(open(base_url+co+companies[i].perma+".js?"+api_key).read)

        #       c = Company.find_by_perma(company_data["permalink"])
        # # Jacob
        #       if company_data["category_code"] == nil
        #          c.industry_id = Industry.first.id
        #       elsif Industry.find_by_name(company_data["category_code"]) == nil
# seems slow!
        #           Industry.create(name: company_data["category_code"])
        #           c.industry_id = Industry.find_by_name(company_data["category_code"]).id

        #         else
        #           c.industry_id = Industry.find_by_name(company_data["category_code"]).id

        #       end

# can go away!
        #       c.crunch_url = company_data["crunchbase_url"]
        #       c.home_url = company_data["homepage_url"]

# can go away!
        #       # Logic in case the company is dead

        #       if company_data["deadpooled_year"] == nil
        #           c.dead_date = nil
        #         elsif company_data["deadpooled_month"] == nil
        #           c.dead_date = Date.new(company_data["deadpooled_year"])
        #         elsif company_data["deadpooled_data"] == nil
        #           c.dead_date = Date.new(company_data["deadpooled_year"], company_data["deadpooled_month"])
        #         else
        #           c.dead_date = Date.new(company_data["deadpooled_year"], company_data["deadpooled_month"], company_data["deadpooled_day"])
        #       end
# can go away!
        #       if company_data["founded_year"] == nil
        #           c.founded_date = nil
        #       elsif company_data["founded_month"] == nil && company_data["founded_day"] == nil
        #           c.founded_date = Date.new( company_data["founded_year"] )
        #       elsif company_data["founded_day"] == nil
        #           c.founded_date = Date.new( company_data["founded_year"], company_data["founded_month"] )
        #       else
        #           c.founded_date = Date.new( company_data["founded_year"], company_data["founded_month"], company_data["founded_day"] )
        #       end

        #     c.save

# stays!!
        # #       # Assumes that the first location is their headquarters
        #       l = Location.new
        #       l.address1 = company_data['offices'][0]['address1']
        #       l.address2 = company_data['offices'][0]['address12']
        #       l.zipcode = company_data['offices'][0]['zip_code']
        #       l.city = company_data['offices'][0]['city']
        #       l.statecode = company_data['offices'][0]['state_code']
        #       l.countrycode = company_data['offices'][0]['country_code']
        #       if company_data['offices'][0]['latitude'].present?
        #         l.latitude = company_data['offices'][0]['latitude']
        #         l.longitude = company_data['offices'][0]['longitude']
        #       else

        #       end
        #       l.company_id = c.id
        #       l.save

# status somewhere else!
        # puts "There are #{Company.all.count} companies in the database"
        # puts "There are #{Industry.all.count} industries in the database"
        # puts "There are #{Location.all.count} locations in the database"

        # #       # -------------- Company Funding Rounds -------------- #

# stays
        #       company_data["funding_rounds"].each do |round|
        #         # Need to include entity_id when seeding
        #         f = Funding.new
        #         f.company_id = c.id

        # # Jacob!!
        # # This is changed   dan has better file!!
# stays
        #         if round["round_code"] == "unattributed"
        #             f.funding_code = "venture round"
        #           else
        #             f.funding_code = round["round_code"]
        #         end
# stays (usefull the if else? try?)
        #         if round["raised_amount"] != nil
        #             f.funding_amount = round["raised_amount"]
        #           else
        #             f.funding_amount = nil
        #         end
# stays (usefull the if else? try?)
        #         if round["raised_currency_code"] != nil
        #             f.funding_currency = round["raised_currency_code"]
        #           else
        #             f.funding_currency = nil
        #         end
# stays
        #         if round["funded_year"] == nil
        #             f.funding_date = nil
        #           elsif round["funded_month"] == nil
        #             f.funding_date = Date.new( round["funded_year"] )
        #           elsif round["funded_day"] == nil
        #             f.funding_date = Date.new( round["funded_year"], round["funded_month"])
        #           else
        #             f.funding_date = Date.new(round["funded_year"], round["funded_month"], round["funded_day"])
        #         end
# stays
        #         f.save
        #         puts "There are #{Funding.all.count} funding rounds in the database"

        #         # Twitter situation: There are several instances where there are not any investors in a round in Crunchbase - how should we handle
# stays
        #             if round["investments"].empty?
        #               i = Investment.new
        #               i.funding_id = f.id
        #               i.save
        #             end

        #             round["investments"].each do |investment|

        #               if investment["company"] != nil
        #                   # Need to include funding_round_id when seeding
        #                   company = Company.find_by_perma(investment["company"]["permalink"])
        #                   company.investments.create(funding_id: f.id)

        #                 elsif investment["financial_org"] != nil
        #                   # Need to include funding_round_id when seeding
        #                   financial = Financial.find_by_perma(investment["financial_org"]["permalink"])
        #                   financial.investments.create(funding_id: f.id)

        #                   # i = Investment.new
        #                   # i.funding_id = f.id
        #                   # i.financial_perma = investment["financial_org"]["permalink"]
        #                   # i.investable_id = Financial.find_by_perma(i.financial_perma).id
        #                   # i.investable_type="financial"
        #                   # i.save

        #                 elsif investment["person"] != nil
        #                   # Need to include funding_round_id when seeding
        #                   individual = Individual.find_by_perma(investment["person"]["permalink"])
        #                   individual.investments.create(funding_id: f.id)
        #                   # i = Investment.new
        #                   # i.funding_id = f.id
        #                   # i.individual_perma = investment["person"]["permalink"]
        #                   # i.investable_id = Individual.find_by_perma(i.individual_perma).id
        #                   # i.investable_type="individual"
        #                   # i.save

        #                 else

        #                   # If there is a situation where there is a round but don't know who invested
        #                   # Need to include funding_round_id when seeding
        #                   i = Investment.new
        #                   i.funding_id = f.id
        #                   i.investable_id = nil
        #                   i.save
        #               end

        #             end

        #       end



        #     if company_data["ipo"] != nil

        #        f = Funding.new
        #        f.company_id = c.id
        #        f.funding_code = 'ipo'
        #        f.funding_amount = company_data["ipo"]["valuation_amount"]
        #        f.funding_currency = company_data["ipo"]["valuation_currency_code"]


        #        if company_data["ipo"]["pub_year"] == nil
        #           f.funding_date = nil
        #         elsif company_data["ipo"]["pub_month"] == nil
        #           f.funding_date = Date.new(company_data["ipo"]["pub_year"])
        #         elsif company_data["ipo"]["pub_day"] == nil
        #           f.funding_date = Date.new(company_data["ipo"]["pub_year"], company_data["ipo"]["pub_month"])
        #         else
        #           f.funding_date = Date.new(company_data["ipo"]["pub_year"], company_data["ipo"]["pub_month"], company_data["ipo"]["pub_day"] )
        #         end

        #        f.save

        #     end

        # end

        # end_time = Time.now

        # puts "It took #{end_time - start_time} seconds to run"


