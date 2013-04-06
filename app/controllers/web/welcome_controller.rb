class Web::WelcomeController < Web::ApplicationController
	respond_to :html
	
  def blog
		@posts = Post.publicated
  end

end