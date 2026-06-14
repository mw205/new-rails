# Clear existing data to prevent duplicates and ensure idempotency
PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

# Create Users (Creators)
user1 = User.create!(
  name: "Alice Smith",
  email: "alice@example.com",
  phone_number: "1234567890",
  dob: Date.parse("1995-05-15"),
  address: "123 Main St"
)

user2 = User.create!(
  name: "Bob Jones",
  email: "bob@example.com",
  phone_number: "0987654321",
  dob: Date.parse("1990-10-20"),
  address: "456 Oak Ave"
)

puts "Created #{User.count} users."

# Create Editors
editor1 = Editor.create!(name: "Charlie Editor")
editor2 = Editor.create!(name: "Diana Editor")

puts "Created #{Editor.count} editors."

# Create Posts (associated with Users as creators)
post1 = Post.create!(
  title: "First Awesome Post",
  content: "This is some amazing content about Ruby on Rails.",
  creator: user1
)

post2 = Post.create!(
  title: "Second Cool Post",
  content: "More interesting thoughts about MVC architecture.",
  creator: user2
)

puts "Created #{Post.count} posts."

# Create Many-to-Many associations (Editors editing Posts)
PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)
PostEditor.create!(post: post2, editor: editor2)

puts "Created #{PostEditor.count} join associations (Post-Editor links)."
