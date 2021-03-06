class Admin < ApplicationRecord
  	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable


	attr_accessor :login


	has_one :image, dependent: :destroy


	has_one :admin_quirk, dependent: :destroy
	accepts_nested_attributes_for :admin_quirk



	def admin_quirk
		super || build_admin_quirk
	end


	validates :user_name, presence: true, uniqueness: { case_sensitive: false }

	# Prevent User from Using another's Email as a Username
	validate :validate_username

	def validate_username
	  if Admin.where(email: user_name).exists?
	    	errors.add(:user_name, :invalid)
	  end
	end





	def self.find_for_database_authentication(warden_conditions)
      
      conditions = warden_conditions.dup
      
      if login = conditions.delete(:login)

        	where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      
      else

       		where(conditions.to_h).first

      end
    end

end
