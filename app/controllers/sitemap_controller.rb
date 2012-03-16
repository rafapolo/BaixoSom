class SitemapController < ApplicationController
  def sitemap
    @albuns = Album.order("updated_at DESC").limit(1000)
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = @albuns[0].updated_at.httpdate || Time.now.httpdate
    render :layout => false
  end
end

