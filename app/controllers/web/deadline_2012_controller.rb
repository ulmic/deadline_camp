class Web::Deadline2012Controller < Web::ApplicationController
  def index
    @album = PhotoAlbumDecorator.decorate PhotoAlbum.welcome_album
    @news = News.all

    title t('.dealine_2012')
  end
end
