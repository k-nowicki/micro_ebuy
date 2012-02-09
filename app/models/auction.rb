class Auction < ActiveRecord::Base

  scope :sorted, :order => ("
          CASE type WHEN 'Buynow' THEN 0 WHEN 'Snail' THEN 1 WHEN 'Penny' THEN 2 WHEN 'Common' THEN 3 END , end_at"
          )

  attr_accessible :name, :end_at

  validates :name, :presence => true
  validates :type, :presence => true
  validates :end_at, :presence => true
  validate  :ensure_end_at_after_now

  def ensure_end_at_after_now
    errors.add('end_at', "must be later than now") if end_at && (end_at.to_time - Time.now < 0)
  end


end
