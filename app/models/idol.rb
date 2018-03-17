class Idol < ApplicationRecord
		has_many :talents, dependent: :destroy

		validates :last_name, presence: true



		def run_a_cmd
			cmd = 'heroku pg:backups:capture --app alpha-web-app'
			system cmd
		end
end
