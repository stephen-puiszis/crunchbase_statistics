  desc "Cleans up Investments"
  task :clean_up_investments => :environment do
    start = Time.now
    puts start
    puts Investment.count

    Investment.find_each do |investment|
      if investment[:investable_type] == 'financial' || investment[:investable_type] == 'individual'
        investment.destroy
      end
    end
    end_time = Time.now
    puts "#{end_time - start} seconds"
    puts Investment.count
  end


