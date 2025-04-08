require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let!(:post) { FactoryBot.create(:post) }
  let!(:comment) { FactoryBot.create(:comment, post: post) }

  scenario "User views the list of posts" do
    visit posts_path

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
    expect(page).to have_content(comment.content)
  end
end
