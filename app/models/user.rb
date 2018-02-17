class User < ApplicationRecord
  		# Include default devise modules. Others available are:
  		# :confirmable, :lockable, :timeoutable and :omniauthable
  		devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

        attr_accessor :login


        validates :user_name, presence: true

        # Prevent other Users from using Email of another User as user name.
        validate :validate_user_name 

        def validate_user_name
        	if User.where(:email => user_name).exists?
        		errors.add(:user_name, :invalid)
        	end
        end



        # Find User for DB authentication using the user_name
        def self.find_for_database_authentication(warden_conditions)
      
	      conditions = warden_conditions.dup
	      
	      if login = conditions.delete(:login)

	        	where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	      
	      else

	       		where(conditions.to_h).first

	      end
    	end
end
