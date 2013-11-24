class Identity < OmniAuth::Identity::Models::ActiveRecord
	belongs_to :user
	validates_presence_of :password, on: :create
	validates_presence_of :name
	validates_uniqueness_of :email
	#validates_presence_of :type, on: :create
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

end
