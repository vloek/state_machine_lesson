module PostsHelper
	def publicate_post(post)
		if post.published?
			"#abc"
		else
			"#ddd"
		end
	end
end