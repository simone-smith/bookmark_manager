# As a user
# So I can store bookmark data for later retrieval
# I want to add a bookmark to Bookmark Manager

feature 'Adding bookmarks' do
  scenario 'add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')

    expect(page).to have_content 'http://testbookmark.com'
  end

  scenario 'check URL is valid' do
    visit('/bookmarks/new')
    fill_in('url', with: "not a bookmark")
    click_button "Submit"
    expect(page).to have_content "That is not a valid URL."
  end
end
