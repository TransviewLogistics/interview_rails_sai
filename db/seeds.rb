user = User.create!(name: "Demo User", email: "user@example.com", password: "password", password_confirmation: "password")

first_post = Post.create!(title: "My First Post", content: "This is the content of my first post.")
Comment.create!(post: first_post, content: "Great first post!")
Comment.create!(post: first_post, content: "I agree this first post is super!")

second_post = Post.create!(title: "My Second Post", content: "This is the content of my second post.")
Comment.create!(post: second_post, content: "This second post is not so interesting...")

third_post = Post.create!(title: "My Third Post", content: "This is the content of my third post.")
Comment.create!(post: third_post, content: "AI makes more interesting boilerplate posts than this.")
