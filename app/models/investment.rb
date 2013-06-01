class Investment < ActiveRecord::Base
  attr_accessible :funding_id, :investable_id, :investable_type

  belongs_to :investable, :polymorphic => true

  belongs_to :funding

  def perma
    investable.perma
  end

end
