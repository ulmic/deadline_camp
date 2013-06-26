class Web::Deadline2012Controller < ApplicationController
  def index
    @album = PhotoAlbumDecorator.decorate PhotoAlbum.welcome_album
    @news = News.all.year_published_at(2012)
  end
end
