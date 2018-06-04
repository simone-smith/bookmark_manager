# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of bookmarks on the homepage

feature 'View bookmark' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end
end
