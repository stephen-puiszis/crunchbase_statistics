  desc "Cleans up Investments"
  task :clean_up_investments => :environment do
    Investment.find_each do |investment|
      if investment[:investable_type]=="financial"||investment[:investable_type]=="individual"
        investment.destroy
      end
    end
  end


  desc "Cleans up industry_id in companies table"
  task :clean_industry_id => :environment do
    Company.find_each do |company|
      company.industry_id = company.industry_id - 95
      company.save
     end
  end



  desc "Create industries"

  task  :create_industries => :environment do
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

    puts "Industries: #{Industry.count}"

    end



