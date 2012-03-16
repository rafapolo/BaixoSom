class ApplicationController < ActionController::Base
	protect_from_forgery
	layout "geral", :except => [:stats, :sitemap]

	before_filter :login, :only=>[:new, :upload]
	before_filter :stats

	def login    
		return true if session[:user] && session[:logged] && session[:username]
		session[:href] = request.referer
		flash[:notice] = "Você precisa se autenticar."
		redirect_to("/login")
	end


	def stats		
		@albuns_count = Album.all.count
		@users_count = User.all.count
		@bandas_count = Banda.all.count
	end

end