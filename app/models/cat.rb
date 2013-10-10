class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex
  validates :age, :birth_date, :color, :name, :sex, :presence => true
  validates :sex, inclusion: { in: %w(M F) }

  has_many(
  :cat_rental_requests,
  :class_name => 'CatRentalRequest',
  :primary_key => :id,
  :foreign_key => :cat_id,
  :dependent => :destroy
  )

end