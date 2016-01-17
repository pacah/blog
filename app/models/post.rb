class Post < ActiveRecord::Base
   belongs_to :user
   has_many :comments, dependent: :destroy
   attr_accessible :title, :content
   
   validates :title, presence: true
   validates :content, presence: true
   
   include Tire::Model::Search
   include Tire::Model::Callbacks

end
