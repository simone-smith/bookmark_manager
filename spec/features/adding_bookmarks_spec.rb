# As a user
# So I can store bookmark data for later retrieval
# I want to add a bookmark to Bookmark Manager

feature 'Adding bookmarks' do
  scenario 'add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.ft.com')
    click_button('Submit')

    expect(page).to have_content 'http://www.ft.com'
  end

  scenario 'add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.ft.com')
    fill_in('title', with: 'Financial Times')
    click_button('Submit')

    expect(page).to have_content 'Financial Times'
  end

  scenario 'the bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: "not a bookmark")
    click_button "Submit"

    expect(page).not_to have_content "not a bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
