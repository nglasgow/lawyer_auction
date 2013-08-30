class LegalRequest < ActiveRecord::Base
  attr_accessible :description, :legal_issue

  validates :legal_issue, presence: true

  has_many :bids, dependent: :delete_all
end
