Industry.create([
  { :name => "other", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "web", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "enterprise", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "software", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "network_hosting", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "games_video", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "search", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "mobile", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "advertising", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "ecommerce", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "hardware", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "public_relations", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "security", :created_at => "2013-06-06 04:57:27", :updated_at => "2013-06-06 04:57:27" },
  { :name => "consulting", :created_at => "2013-06-06 04:57:28", :updated_at => "2013-06-06 04:57:28" },
  { :name => "education", :created_at => "2013-06-06 04:57:29", :updated_at => "2013-06-06 04:57:29" },
  { :name => "biotech", :created_at => "2013-06-06 04:57:30", :updated_at => "2013-06-06 04:57:30" },
  { :name => "semiconductor", :created_at => "2013-06-06 04:57:31", :updated_at => "2013-06-06 04:57:31" },
  { :name => "cleantech", :created_at => "2013-06-06 04:57:31", :updated_at => "2013-06-06 04:57:31" },
  { :name => "legal", :created_at => "2013-06-06 04:57:32", :updated_at => "2013-06-06 04:57:32" }
], :without_protection => true )

puts "There are #{Industry.count} database records"
puts Industry.last.id
