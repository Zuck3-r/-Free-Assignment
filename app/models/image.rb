class Image < ApplicationRecord
    has_many :likes, dependent: :destroy
end
