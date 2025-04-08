require 'rails_helper'

RSpec.feature "New Post", type: :feature do
  let(:new_post_title) { "New Post Title" }
  let(:new_post_content) { "New post content text" }

  scenario "User creates a new post" do
    visit posts_path
    click_on "New Post"
    expect(page).to have_current_path(new_post_path)

    fill_in "post[title]", with: new_post_title
    fill_in "post[content]", with: new_post_content
    click_button "Create Post"

    expect(page).to have_content("Post was successfully created")
    expect(page).to have_content(new_post_title)
    expect(page).to have_content(new_post_content)
  end

  scenario "User aborts post creation to navigate back to posts page" do
    visit new_post_path
    click_on "Back to posts"
    expect(page).to have_current_path(posts_path)
  end
end
