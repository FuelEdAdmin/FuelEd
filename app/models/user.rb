class User < ActiveRecord::Base
  has_and_belongs_to_many :schools
  has_one :identity
  USER_TYPES = ["client", "intern", "admin"]

	def self.from_omniauth(auth, rank)
		find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth, rank)
	end

  def self.find_by_provider_and_uid(provider, uid)
    # puts where(provider: provider, uid: uid)
    where(provider: provider, uid: uid).first
  end

	def self.create_with_omniauth(auth, userRank)
		create! do |user|
    	user.provider = auth["provider"]
    	user.uid = auth["uid"]
    	user.name = auth["info"]["name"]
    	user.email = auth["info"]["email"] 
      user.rank = userRank
    end
  end

end
