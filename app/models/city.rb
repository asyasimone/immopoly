class City < ApplicationRecord
  has_many :regulations
  has_many :properties
end
