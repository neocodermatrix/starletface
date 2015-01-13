class Friend
  include Mongoid::Document
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :password, type: String

  def fullname
	self.firstname + " " + self.lastname
  end

end
