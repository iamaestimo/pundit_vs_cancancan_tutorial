User.create(email: 'writer1@example.com', password: 'example', password_confirmation: 'example', role: 0) # this creates a user with the writer role
User.create(email: 'writer2@example.com', password: 'example', password_confirmation: 'example', role: 0) # second writer
User.create(email: 'editor@example.com', password: 'example', password_confirmation: 'example', role: 1) # this creates a user with the editor role

p "Created #{User.all.count} users!"
