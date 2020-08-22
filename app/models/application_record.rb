class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :title, presence: true
  validates :file, presence: true, allow_nil: false
  validates :key, numericality: { only_integer: true }, allow_blank: false , length: { is: 4 }
end