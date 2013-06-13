  desc "Cleans up Investments"
  task :clean_up_investments => :environment do
    Investment.find_each do |investment|
      if investment[:investable_type]=="financial"||investment[:investable_type]=="individual"
        investment.destroy
     end
    end
  end
