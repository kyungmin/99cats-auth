class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex, :user_id
  validates :age, :birth_date, :color, :name, :sex, :user_id, :presence => true
  validates :sex, inclusion: { in: %w(M F) }

  has_many(
  :cat_rental_requests,
  :class_name => 'CatRentalRequest',
  :primary_key => :id,
  :foreign_key => :cat_id,
  :dependent => :destroy
  )

  belongs_to(
  :owner,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )

end