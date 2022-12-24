class Item < ApplicationRecord
 has_one_attached :image
 belongs_to :genre
 enum is_active: { sale: true, stop: false }
end
