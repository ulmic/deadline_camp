class NewsDecorator < Draper::Base
  decorates :news

  def self.published_at_year(year)
    News.find_by_published_at_year(year)
  end
end
