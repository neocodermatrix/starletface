class User
  include Mongoid::Document
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :password, type: String
  field :friends, default: [], type: Array
  field :password_digest, type: String
  mount_uploader :image, AvatarUploader
  attr_reader :password

  has_many :posts

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      return self
    else
      return false
    end
  end

  validates :firstname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :create

  def fullname
  	self.firstname + " " + self.lastname
  end

  def add_friend(friend)
    if (!self.friends.include? friend.id)
        self.push(friends: friend.id)
        self.save
   
        friend.push(friends: self.id)
        friend.save
    else
      false
    end
  end

    def remove_friend(friend)
      self.delete_at(friends: friend.id)
    end

  
end




