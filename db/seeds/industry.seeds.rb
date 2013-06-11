Industry.create([
  { :name => "other" },
  { :name => "advertising" },
  { :name => "biotech" },
  { :name => "cleantech" },
  { :name => "hardware" },
  { :name => "web" },
  { :name => "ecommerce" },
  { :name => "education" },
  { :name => "enterprise" },
  { :name => "games_video" },
  { :name => "legal" },
  { :name => "mobile" },
  { :name => "network_hosting" },
  { :name => "consulting" },
  { :name => "public_relations" },
  { :name => "search" },
  { :name => "security" },
  { :name => "semiconductor" },
  { :name => "software" }
], :without_protection => true )

puts "There are #{Industry.count} database records"
