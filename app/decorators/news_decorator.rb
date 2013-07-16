class NewsDecorator < Draper::Decorator
  decorates :news

  def self.published_at_year(year)
    News.find_by_published_at_year(year)
  end
end
