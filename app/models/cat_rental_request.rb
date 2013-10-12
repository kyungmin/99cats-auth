class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :start_date, :end_date, :status
  validates :cat_id, :start_date, :end_date, :status, :presence => true
  validates :status, inclusion: { in: %w{PENDING APPROVED DENIED}}
  validate :overlapping_approved_requests

  before_validation(on: :create) do
    self.status ||= "PENDING"
  end

  belongs_to(
  :cat,
  :class_name => 'Cat',
  :primary_key => :id,
  :foreign_key => :cat_id
  )

  def approve!
    self.status = "APPROVED"
#    self.transaction do
      self.update_attributes!({status: self.status})
#      self.save!
#    end
    # self.cat.cat_rental_requests.each do |request|
    #   if overlapping_pending_requests
    #     deny!
    #   end
    # end
  end

  def deny!
    self.status = "DENIED"
    self.update_attributes!({status: self.status})
  end

  def pending?
    self.status == "PENDING"
  end

  private

  def overlapping_requests
    CatRentalRequest.all.each do |request|
      next if request.id == self.id || request.cat_id != self.cat_id
      if self.start_date.between?(request.start_date, request.end_date) || self.end_date.between?(request.start_date, request.end_date)
        return true
      end
    end
    false
  end

  def overlapping_approved_requests
    if overlapping_requests && self.status == "APPROVED"
      errors[:start_date] << "Date overlapping"
    end
  end

  def overlapping_pending_requests
    overlapping_requests && self.status == "PENDING"
  end


end
