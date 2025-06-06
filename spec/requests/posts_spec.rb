require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/posts", type: :request do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    let!(:post) { FactoryBot.create(:post) }

    it "renders a successful response" do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let!(:post) { FactoryBot.create(:post) }

    it "renders a successful response" do
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let!(:post) { FactoryBot.create(:post) }

    it "renders a successful response" do
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:valid_attributes) {
      {title: "test title", content: "test content"}
    }

    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }
      let!(:post) { FactoryBot.create(:post) }

      it "updates the requested post" do
        patch post_url(post), params: { post: new_attributes }
        post.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the post" do
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end

    context "with invalid parameters" do
      let!(:post) { FactoryBot.create(:post) }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    let!(:post) { FactoryBot.create(:post) }

    it "destroys the requested post" do
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
