class Idol < ApplicationRecord
		has_many :talents, dependent: :destroy

		validates :last_name, presence: true



		
end
