# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Users: "
n = 0
array = ["72 Rue de la Merci", "82 Rue Clare", "35 Cours Balguerie Stuttenberg", "41 Rue Saint-Sernin", "87 Avenue Jules Guesde"]
array2 = ["24 Rue des Remparts", "72 Place Fernand Lafargue", "93 Avenue de la Libération Charles de Gaulle", "19 Quai de la Grave", "21 Rue Castelnau d'Auros", "93 Rue de la Vieille Tour", "38 Place du Séminaire", "41 Rue Saint-Sernin", "88 Allées de Bristol", "94 Place de la Victoire"]
5.times do
  n += 1
  user = User.new(first_name: "first_name#{n}",
                  last_name: "last_name#{n}",
                  email: "user#{n}@populum.com",
                  password: "123456",
                  role: "citizen",
                  score: 0,
                  address: "#{array.pop}, Bordeaux")
  user.save
  puts "User #{n} created 💁🏻‍♀️"
  2.times do
    suggestion = Suggestion.new(title: "Lorem ipsum",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                address: "#{array2.pop}, Bordeaux",
                                votes: 0,
                                status: nil)
    suggestion.user = user
    suggestion.save
    puts "User #{n} wrote suggestion #{suggestion.id}"

    rand(2..3).times do
      comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            votes: 0)
      comment.suggestion = suggestion
      comment.user = user
      puts "User #{n} commented suggestion #{suggestion.id}"
    end
  end
end
