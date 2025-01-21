class Simulation < ApplicationRecord
  has_many :leads
  belongs_to :project
end
