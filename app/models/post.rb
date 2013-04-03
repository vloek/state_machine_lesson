class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, presence: true
  after_save :check_content

  state_machine :initial => :unsuitable_to_publication do
  	before_transition any => [:published, :ready_to_publication], :do => :check_content

  	# EVENTS
  	event :publicate do 
  		transition [:unsuitable_to_publication, :ready_to_publication] => :published
  	end

  	event :checking do 
  		transition [:published, :unsuitable_to_publication] => :ready_to_publication
  	end

  	event :unpreparedness do 
  		transition [:published, :ready_to_publication] => :unsuitable_to_publication
  	end

  	# STATES
  	state :ready_to_publication
  	state :published
  end


  def check_content
  	if self.content == '' || self.content.nil?
  		self.unpreparedness
  	end
  end
end
