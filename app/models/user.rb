class User < ActiveRecord::Base
  has_and_belongs_to_many :schools
  has_one :identity, :dependent => :destroy
  USER_TYPES = ["participant", "counselor", "admin"]
  @@randIDs = (1..100000).to_a.shuffle

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates :rank, :inclusion => { :in => USER_TYPES, :message => "%{value} is not a valid user type" }

	def self.from_omniauth(auth, rank, school)
		find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth, rank, school)
	end

  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end

	def self.create_with_omniauth(auth, userRank, school)
	#	create! do |user|
    	#user.provider = auth["provider"]
    	#user.uid = @@randIDs.pop
    	#user.name = auth["info"]["name"]
    	#user.email = auth["info"]["email"] 
      #user.rank = userRank
    	#end

	user = self.new
    	user.provider = auth["provider"]
    	user.uid = auth["uid"]
    	if userRank == "participant"
    		user.name = @@randIDs.pop.to_s  #auth["info"]["name"]
		user.email = user.name + "@fueled.com"
		user.schools << School.find_by_name(school)
	else
    		user.name = auth["info"]["name"]
		user.email = auth["info"]["email"]
	end
        user.rank = userRank
	#if school
	#    user.schools << School.find_by_name(school)
	#end
	user.save

	my_identity = Identity.find_by_email("c@fueled.com")
	if my_identity
		my_identity.email = user.email #user.uid.to_s + "@fueled.com"
		my_identity.save!
	end

	user

  end

end
