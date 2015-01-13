class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  

belongs_to :user
embeds_many :comments

def date_published
  created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
end

end