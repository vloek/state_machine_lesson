class Post < ActiveRecord::Base
  attr_accessible :content, :title, :publ

  validates :title, presence: true

  # SCOPES
  scope :publicated, where(:state => 'published')

  # Used gem state_machine
  state_machine :initial => :unsuitable_to_publication do
    # STATES
    state :unsuitable_to_publication

    state :ready_to_publication do
      validates :content, presence: true
    end

    state :published do 
      validates :content, presence: true
    end
    
  	# EVENTS
  	event :publicate do 
  		transition any => :published
  	end

    event :unpublicate do
      transition any => :ready_to_publication
    end

  end

  def publ
    self.published?
  end

  def publ=(x)
    if x == true.to_s
      self.publicate
    else
      self.unpublicate if self.publ
    end
  end
end
