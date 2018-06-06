require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do

      # Add the test data
      Bookmark.create(url: "http://makersacademy.com")

      expected_url = 'http://makersacademy.com'
      expected_title = 'holding_title'

      expect(Bookmark.all).to include expected_url
      expect(Bookmark.all).to include expected_title

    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')

      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end

    it 'creates a new bookmark with a title' do
      Bookmark.create({url: 'http://www.theguardian.com'}, {title: 'The Guardian'})

      expect(Bookmark.all).to include 'The Guardian'
    end

    it "does not create a new bookmark if the URL is not valid" do
      Bookmark.create(url: 'not a bookmark')
      expect(Bookmark.all).not_to include 'not a bookmark'
    end
  end


end
