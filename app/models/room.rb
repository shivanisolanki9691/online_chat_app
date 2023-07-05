class Room < ApplicationRecord
	has_many :messages
	# belongs_to :user
    # has_many :messages
end
