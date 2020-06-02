class Produto < ApplicationRecord
  has_one_attached :foto
	validates :nome, uniqueness: true
end

