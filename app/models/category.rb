class Category < ApplicationRecord
  has_many :users, -> { where role: 'doctor'}
end
