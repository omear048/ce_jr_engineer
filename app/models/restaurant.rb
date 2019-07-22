class Restaurant < ApplicationRecord
  validates_uniqueness_of :name
end
