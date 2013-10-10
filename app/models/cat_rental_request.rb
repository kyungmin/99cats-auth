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

  private
  def overlapping_approved_requests
    CatRentalRequest.all.each do |request|
      next if request.id == self.id
      if self.start_date.between?(request.start_date, request.end_date) ||               self.end_date.between?(request.start_date, request.end_date)
        errors[:start_date] << "Date overlapping" if (self.status == 'APPROVED')
      end
    end
  end

  # def overlapping_approved_requests
  #   overlapping_requests && self.status == 'APPROVED'
  # end


end
