class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true, length: { is: 10 }
  validates :name, uniqueness: true
end
