class Schedule < ApplicationRecord
  belongs_to :user
  has_many :time_values, dependent: :destroy
  accepts_nested_attributes_for :time_values, allow_destroy: true
end
