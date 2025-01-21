class Project < ApplicationRecord
  has_many :properties
  has_many :simulations
  belongs_to :user
end
