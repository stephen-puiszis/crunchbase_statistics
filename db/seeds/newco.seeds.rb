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


all_companies = JSON.parse(open(base_url + cos+ "page=25" + api_key).read)


all_companies.each do |company|

      c = Company.new
      c.name = company["name"]
      c.perma = company["permalink"]

        if company["category_code"] == nil
           c.industry_id = Industry.first.id

        elsif Industry.find_by_name(company["category_code"]) == nil
            Industry.create(name: company["category_code"])
            c.industry_id = Industry.find_by_name(company["category_code"]).id
        else
            c.industry_id = Industry.find_by_name(company["category_code"]).id
        end
     c.save

end

puts "There are #{Company.all.count} Company database records"
