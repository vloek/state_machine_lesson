class Post < ActiveRecord::Base
  attr_accessible :content, :state, :title

  validates :title, presence: true

end
