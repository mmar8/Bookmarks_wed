require 'pg'

feature 'add bookmarks' do
  scenario 'A user can add bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.yahoo.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.yahoo.com')
  end
end
