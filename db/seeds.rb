Profile.destroy_all
User.destroy_all
Discussion.destroy_all
Join.destroy_all
Event.destroy_all
Bill.destroy_all



puts "Creating new database..."

luca = User.create(email: "luca@luca.com", password: "123456", first_name: "Luca", last_name: "De Montis")
anna = User.create(email: "anna@anna.com", password: "123456", first_name: "Anna", last_name: "Bendahan")
xavi = User.create(email: "xavi@xavi.com", password: "123456", first_name: "Xavi", last_name: "Ros")
ben = User.create(email: "ben@ben.com", password: "123456", first_name: "Ben", last_name: "De Boissieu")
nico = User.create(email: "nico@nico.com", password: "123456", first_name: "Nico", last_name: "Marion")


# photo: 'app/assets/images/Japanese/ramen-main.jpg'

luca = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: luca)
image_src = File.join(Rails.root, "/app/assets/images/Japanese/surf_home.jpg")
src_file = File.new(image_src)
luca.profile_picture = src_file
luca.save

anna = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 90, Barcelona", user: anna)
image_src = File.join(Rails.root, "/app/assets/images/Japanese/surf_home.jpg")
src_file = File.new(image_src)
anna.profile_picture = src_file
anna.save

xavi = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: xavi)

ben = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: ben)
image_src = File.join(Rails.root, "/app/assets/images/Japanese/surf_home.jpg")
src_file = File.new(image_src)
ben.profile_picture = src_file
ben.save

nico = Profile.create!(description_user: "I m a good baby surfers", phone: "0686650294", address: "Calle Girona, 108, Barcelona", user: nico)
image_src = File.join(Rails.root, "/app/assets/images/Japanese/surf_home.jpg")
src_file = File.new(image_src)
nico.profile_picture = src_file
nico.save

bondi_event = Event.create!(title_event: "Baby event", description_user: "lets meet a 9am", location: "bondi beach", user: luca)
Hossegor = Event.create!(title_event: "Hossegor surf", description_user: "lets meet a 9am", location: "Hossegor", user: nico)


puts "Finished!"
