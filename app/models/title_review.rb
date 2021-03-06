class TitleReview < ActiveRecord::Base 
	belongs_to :title
	belongs_to :user
	has_many :title_review_ratings
	has_many :review_comments

	def self.max_body_length
		1000
	end

	def self.per_page
		20
	end

	validates_presence_of :user, :title, :body
	validates_length_of :body, :in => 2..TitleReview::max_body_length, :allow_blank => :true

	def get_user_rating(user_id)
		rating = TitleReviewRating.find(:first, :conditions => ["user_id=? and title_review_id=?", user_id, self.id])
		if rating
			rating.rating
		else
			0
		end
	end
end
