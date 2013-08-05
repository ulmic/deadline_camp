class Web::WelcomeController < Web::ApplicationController
  def index
    @news = News.published_at_year(2013).last(5).reverse
    @photo_album = PhotoAlbumDecorator.decorate PhotoAlbum.welcome_album
  end

  def place
    title t 'place'
  end
end
