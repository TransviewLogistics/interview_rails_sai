require 'rails_helper'

RSpec.feature "Show Post", type: :feature do
  let!(:post) { FactoryBot.create(:post) }

  scenario "User views a single post" do
    visit posts_path
    click_on "Show this post"

    expect(page).to have_current_path(post_path(post))
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
  end

  scenario "User destroys a post" do
    visit post_path(post)
    click_on "Destroy this post"

    expect(page).to have_current_path(posts_path)
    expect(page).to have_content("Post was successfully destroyed")
    expect(Post.count).to eq(0)
  end

  scenario "User navigates back to posts index" do
    visit post_path(post)
    click_on "Back to posts"

    expect(page).to have_current_path(posts_path)
  end
end
