class NewsDecorator < Draper::Base
  decorates :news

  def year_published_at(year)
    News.find_by_published_at(year)
  end
end
