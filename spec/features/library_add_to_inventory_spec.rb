describe Library do
  feature "index page" do
    scenario "the librarian is able to add new books to the index page" do
      visit '/'
      click_button 'Add more books'
      fill_in 'title', with: 'Anna Karenina'
      fill_in 'author', with: 'Leo Tolstoy'
      fill_in 'isbn', with: '9780141199610'
      click_button 'Add'
      expect(page).to have_content("Anna Karenina - Leo Tolstoy - 9780141199610")
    end
  end
end
