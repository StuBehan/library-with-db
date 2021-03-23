describe Library do
  feature "index page" do
    scenario "user wants to view the library inventory" do
      visit '/'
      expect(page).to have_content("The cat sat on the mat")
    end
  end
end