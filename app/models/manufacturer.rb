class Manufacturer < ActiveRecord::Base
  has_many :drivers

  validates :name, presence: { message: 'Enter name' }
end
