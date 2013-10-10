class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex
  validates :age, :birth_date, :color, :name, :sex, :presence => true
  validates :sex, inclusion: { in: %w(M F) }
end