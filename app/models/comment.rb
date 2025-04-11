class Comment < ActiveRecord::Base
  belongs_to :post

  after_commit :reindex_post

  private

  def reindex_post
    post.reindex # async due to Post config
  end
end
