#Event.destroy_all
#User.destroy_all

Likecategory.destroy_all


puts "Creating new database..."

#luca = User.create(email: "luca@luca.com", password: "123456", first_name: "Luca", last_name: "De Montis")
#luca.save
#anna = User.create(email: "anna@anna.com", password: "123456", first_name: "Anna", last_name: "Bendahan")
#anna.save


likecategories = %w(Drink Sunbathing BBQ Volley-ball Running Surf-trip)
likecategories.each do |category|
  Likecategory.create!(name: category)
end




puts "Finished!"
