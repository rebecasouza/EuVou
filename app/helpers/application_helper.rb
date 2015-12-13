module ApplicationHelper
	def user_email(event)
		event.user.present? ? event.user.email : "an anonymous user"
  end

  def user_roles(user)
    user.roles.map(&:name).join(', ').titleize
  end

  def link_to_provider(user)
    provider = user.identities.map(&:provider).join(', ')
    provider = case provider
    when 'facebook' then link_to( 'Facebook', "http://www.facebook.com" )
    when "twitter" then link_to( 'Twitter', "http://twitter.com" )
		when "google_oauth2" then link_to( 'Google', "http://google.com" )
		when 'forusquare'    then link_to( 'Foursquare', "http://foursquare.com")
    end

  end
end
