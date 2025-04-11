class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  searchkick(
    text_middle: [:title, :content, :comment_content],
    callbacks: :async
  )

  def search_data
    {
      title: title,
      content: content,
      comment_content: comments.pluck(:content) # fast, avoids N+1
    }
  end

  def self.search_with_comments(query)
    search(
      query,
      fields: ["title", "content", "comment_content"],
      match: :text_middle,
      includes: [:comments]
    )
  end
end
