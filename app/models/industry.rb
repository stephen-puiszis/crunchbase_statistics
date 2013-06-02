class Industry < ActiveRecord::Base
  attr_accessible :name

  has_many :companies


  def self.funded
    total=0

    self.companies.each |c|
      if c==nil || c.fundings==nil
        next
      end
      c.fundings.each |f|
        if f==nil || f.funding_amount==nil
          next
        end
        total+=f.funding_amount
      end
    end
    return total
  end


end
