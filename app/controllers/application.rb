# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '455e48fedc601070a5a1eb98ddffca90'

private

	def authorize_admins_only
		user = User.find_by_id(session[:user_id])
		unless user && user.user_type == 'A'
			render :layout => 'default', :text => "<p id=\"flash_notice\">Only administrators can access this page.</p>"
		end
	end

	def authorize_moderators_only
		user = User.find_by_id(session[:user_id])
		unless user && user.user_type =~ /^(A|M)$/
			render :layout => 'default', :text => "<p id=\"flash_notice\">Only moderators and administrators can access this page.</p>"
		end
	end

	def authorize_users_only
		user = User.find_by_id(session[:user_id])
		unless user && user.user_type =~ /^(A|M|C|U)$/
			render :layout => 'default', :text => "<p id=\"flash_notice\">Only logged in users can access this page.</p>"
		end
	end

	def get_originating_user_id
		raise "The 'get_originating_user_id' method needs to be overwritten in the controller, before calling the 'authorize_originating_user_only' method."
	end

	def authorize_originating_user_only
		#raise [get_originating_user_id, session[:user_id]].inspect
		if get_originating_user_id != session[:user_id]
			render :layout => 'default', :text => "<p id=\"flash_notice\">Only that user can access this page.</p>"
		end
	end
end

