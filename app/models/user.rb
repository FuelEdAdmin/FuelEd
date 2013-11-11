class User < ActiveRecord::Base
  USER_TYPES = ["client", "intern", "admin"]

	def self.from_omniauth(auth)
		find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
	end

  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end

	def self.create_with_omniauth(auth)
  		create! do |user|
    	user.provider = auth["provider"]
    	user.uid = auth["uid"]
    	user.name = auth["info"]["name"]
    	user.email = auth["info"]["email"] 
  	end
end
end
