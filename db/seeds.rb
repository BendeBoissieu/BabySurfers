Join.destroy_all
Discussion.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all




puts "Creating new database..."

luca = User.create(email: "luca@luca.com", password: "123456", first_name: "Luca", last_name: "De Montis")
image_src = File.join(Rails.root, "/app/assets/images/surf_home.jpg")
src_file = File.new(image_src)
luca.profile_picture = src_file
luca.save
anna = User.create(email: "anna@anna.com", password: "123456", first_name: "Anna", last_name: "Bendahan")
image_src = File.join(Rails.root, "/app/assets/images/surf_session.jpg")
src_file = File.new(image_src)
anna.profile_picture = src_file
anna.save
xavi = User.create(email: "xavi@xavi.com", password: "123456", first_name: "Xavi", last_name: "Ros")
ben = User.create(email: "ben@ben.com", password: "123456", first_name: "Ben", last_name: "De Boissieu")
image_src = File.join(Rails.root, "/app/assets/images/surf_home.jpg")
src_file = File.new(image_src)
ben.profile_picture = src_file
ben.save
nico = User.create(email: "nico@nico.com", password: "123456", first_name: "Nico", last_name: "Marion")
image_src = File.join(Rails.root, "/app/assets/images/Surfboard.jpg")
src_file = File.new(image_src)
nico.profile_picture = src_file
nico.save



luca = Profile.create(phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: luca)

anna = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 90, Barcelona", user: anna)

xavi = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: xavi)

ben = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: ben)

nico = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: nico)

bondi_event = Event.create!(title_event: "Baby event", description: "lets meet a 9am", location: "bondi beach", user: luca)
Hossegor = Event.create!(title_event: "Hossegor surf", description: "lets meet a 9am", location: "Hossegor", user: nico)


puts "Finished!"
