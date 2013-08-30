class Bid < ActiveRecord::Base
  belongs_to :legal_request
  belongs_to :user
  attr_accessible :final_bid, :preliminary_advice

  validates :final_bid, presence: true, numericality: { greater_than: 0 }
  validates :preliminary_advice, :presence => true,
                          :length => { :minimum => 10 }
end
