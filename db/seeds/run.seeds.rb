
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

# # --------------------------------------- Individual Seeding --------------------------------- #
individuals = Individual.offset(run_number * number_of_queries).limit(number_of_queries)
individuals.each_index do |j|

    person_data = JSON.parse(open(base_url+person+individuals[j].perma+".js?"+api_key).read)

    i = Individual.find_by_perma(person_data["permalink"])

    i.crunch_url = person_data["crunchbase_url"]
    i.home_url = person_data["homepage_url"]
    i.save

end

puts "There are #{Individual.all.count} people in the database"


end_time = Time.now

puts "It took #{end_time - start_time} seconds to run"


