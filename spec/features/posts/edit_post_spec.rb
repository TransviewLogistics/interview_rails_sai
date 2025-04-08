require 'rails_helper'

RSpec.feature "Edit Post", type: :feature do
  let!(:post) { FactoryBot.create(:post) }
  let(:original_title) { post.title }
  let(:original_content) { post.content }

  let(:updated_title) { "Updated Title" }
  let(:updated_content) { "Updated content text" }

  scenario "User successfully edits an existing post" do
    visit posts_path
    click_on "Show this post"
    click_on "Edit this post"
    expect(page).to have_current_path(edit_post_path(post))

    fill_in "post[title]", with: updated_title
    fill_in "post[content]", with: updated_content
    click_button "Update Post"

    expect(page).to have_content("Post was successfully updated")
    expect(page).to have_content(updated_title)
    expect(page).to have_content(updated_content)
    expect(page).not_to have_content(original_title)

    post.reload
    expect(post.title).to eq(updated_title)
    expect(post.content).to eq(updated_content)
  end

  scenario "User navigates to show and index pages" do
    visit edit_post_path(post)
    click_on "Show this post"
    expect(page).to have_current_path(post_path(post))

    visit edit_post_path(post)
    click_on "Back to posts"
    expect(page).to have_current_path(posts_path)
  end
end
