class Web::FirstDeadlineController < Web::ApplicationController
  def index
    @album = PhotoAlbumDecorator.decorate PhotoAlbum.welcome_album
    @news = News.published_at_year(2012).last(5).reverse

    title t('deadline_2012')
  end

  def news
    title t 'news'
    @news = News.published_at_year(2012)
  end
end
