require 'pg'
require 'uri'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    url_array = result.map { |bookmark| bookmark['url'] }
    title_array = result.map { |bookmark| bookmark['title'] }
    final_array = []
    for n in 0..url_array.size
      final_array << url_array[n]
      final_array << title_array[n]
    end
    final_array
  end

  def self.create(url_options, title_options = {title: 'holding_title'})
    return false unless is_url?(url_options[:url])
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url_options[:url]}', '#{title_options[:title]}')")
  end

  private
  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
