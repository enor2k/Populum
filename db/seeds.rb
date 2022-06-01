# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# puts "Users destroyed"
# Suggestion.destroy_all
# puts "Suggestions destroyed"
# Comment.destroy_all
# puts "Comments destroyed"

array1 = ["24 Rue des Remparts", "72 Place Fernand Lafargue"]
array2 = ["93 Avenue de la Libération Charles de Gaulle", "19 Quai de la Grave"]
array3 = ["21 Rue Castelnau d'Auros", "93 Rue de la Vieille Tour"]
array4 = ["38 Place du Séminaire", "41 Rue Saint-Sernin"]
array5 = ["88 Allées de Bristol", "94 Place de la Victoire"]

puts "Creating Enor"
1.times do
  user = User.create(first_name: "Enor",
                     last_name: "de Kerdanet",
                     email: "enor2k@populum.com",
                     password: "123456",
                     role: "citizen",
                     score: rand(50..654),
                     address: "72 Rue de la Merci, Bordeaux")
  puts "Enor de Kerdanet signed up"

  2.times do
    suggestion = Suggestion.new(title: "Lorem ipsum",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                address: "#{array1.pop}, Bordeaux",
                                votes: rand(-3..231),
                                status: nil)
    suggestion.user = user
    suggestion.save
    puts "Enor wrote a suggestion 📝"
  end
  rand(2..3).times do
    comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          votes: rand(-3..231),
                          suggestion_id: rand(1..10))
    comment.user = user
    comment.save
    puts "Enor wrote a comment 💬"
  end
end

puts "Creating Brice"
1.times do
  user = User.create(first_name: "Brice",
                     last_name: "Pirioua",
                     email: "bricep@populum.com",
                     password: "123456",
                     role: "citizen",
                     score: rand(50..654),
                     address: "82 Rue Clare, Bordeaux")
  puts "Brice Pirioua signed up"

  2.times do
    suggestion = Suggestion.new(title: "Lorem ipsum",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                address: "#{array2.pop}, Bordeaux",
                                votes: rand(-3..231),
                                status: nil)
    suggestion.user = user
    suggestion.save
    puts "Brice wrote a suggestion 📝"
  end

  rand(2..3).times do
    comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          votes: rand(-3..231),
                          suggestion_id: rand(1..10))
    comment.user = user
    comment.save
    puts "Brice wrote a comment 💬"
  end
end

puts "Creating Cyprien"
1.times do
  user = User.create(first_name: "Cyprien",
                     last_name: "Rezki",
                     email: "cyprienr@populum.com",
                     password: "123456",
                     role: "citizen",
                     score: rand(50..654),
                     address: "35 Cours Balguerie Stuttenberg, Bordeaux")
  puts "Cyprien Rezki signed up"

  2.times do
    suggestion = Suggestion.new(title: "Lorem ipsum",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                address: "#{array3.pop}, Bordeaux",
                                votes: rand(-3..231),
                                status: nil)
    suggestion.user = user
    suggestion.save
    puts "Cyprien wrote a suggestion 📝"
  end

  rand(2..3).times do
    comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          votes: rand(-3..231),
                          suggestion_id: rand(1..10))
    comment.user = user
    comment.save
    puts "Cyprien wrote a comment 💬"
  end
end
puts "Creating Marc"
1.times do
  user = User.create(first_name: "Marc",
                     last_name: "Delesalle",
                     email: "marcd@populum.com",
                     password: "123456",
                     role: "citizen",
                     score: rand(50..654),
                     address: "41 Rue Saint-Sernin, Bordeaux")
  puts "Marc Delesalle signed up"

  2.times do
    suggestion = Suggestion.new(title: "Lorem ipsum",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                address: "#{array4.pop}, Bordeaux",
                                votes: rand(-3..231),
                                status: nil)
    suggestion.user = user
    suggestion.save
    puts "Marc wrote a suggestion 📝"
  end

  rand(2..3).times do
    comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          votes: rand(-3..231),
                          suggestion_id: rand(1..10))
    comment.user = user
    comment.save
    puts "Marc wrote a comment 💬"
  end
end

puts "Creating Adrien"
1.times do
  user = User.create(first_name: "Adrien",
                     last_name: "Schaffner",
                     email: "adreins@populum.com",
                     password: "123456",
                     role: "citizen",
                     score: rand(50..654),
                     address: "87 Avenue Jules Guesde, Bordeaux")
  puts "Adrien Schaffner signed up"

  2.times do
    suggestion = Suggestion.new(title: "Lorem ipsum",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                address: "#{array5.pop}, Bordeaux",
                                votes: rand(-3..231),
                                status: nil)
    suggestion.user = user
    suggestion.save
    puts "Adrien wrote a suggestion 📝"
  end

  rand(2..3).times do
    comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          votes: rand(-3..231),
                          suggestion_id: rand(1..10))
    comment.user = user
    comment.save
    puts "Adrien wrote a comment 💬"
  end
end
