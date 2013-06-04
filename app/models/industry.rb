class Industry < ActiveRecord::Base
  attr_accessible :name

  has_many :companies


  def funded
    total=0

    self.companies.each do |c|
      if c==nil || c.fundings==nil
        next
      end
      c.fundings.each do |f|
        if f==nil || f.funding_amount==nil || f.funding_code=="ipo"
          next
        end
        total+=f.funding_amount
      end
    end
    return total
  end



end
