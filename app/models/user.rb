class User < ActiveRecord::Base
  has_and_belongs_to_many :schools
  has_one :identity, :dependent => :destroy
  USER_TYPES = ["client", "intern", "admin"]

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates :rank, :inclusion => { :in => USER_TYPES, :message => "%{value} is not a valid user type" }

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
