class Talent < ApplicationRecord

		belongs_to :idol

		validates :description, presence: true


		rescue ActiveRecord::RecordInvalid, errors.add("Not valid")
end
