class Cat < ApplicationRecord
  validates :name, :birth_date, :color, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(black orange torty white brown),
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex" }
    
  # validates :size, inclusion: { in: %w(small medium large),
  #   message: "%{value} is not a valid size" }
end
