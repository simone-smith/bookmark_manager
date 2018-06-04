feature 'testing infrastructure' do
  scenario 'homepage has correct content' do
    visit ('/')
    expect(page).to have_content 'page working!'
  end
end
