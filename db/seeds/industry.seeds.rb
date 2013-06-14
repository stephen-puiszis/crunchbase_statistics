start_time = Time.now
Industry.create([
  { :name => "other" },
  { :name => "web" },
  { :name => "enterprise" },
  { :name => "software" },
  { :name => "network_hosting" },
  { :name => "games_video" },
  { :name => "search" },
  { :name => "mobile" },
  { :name => "advertising" },
  { :name => "ecommerce" },
  { :name => "hardware" },
  { :name => "public_relations" },
  { :name => "security" },
  { :name => "consulting" },
  { :name => "education" },
  { :name => "biotech" },
  { :name => "semiconductor" },
  { :name => "cleantech" },
  { :name => "legal" }
], :without_protection => true )

end_time = Time.now
puts "#{end_time - start_time} seconds"
puts "#{Industry.count} industries"
