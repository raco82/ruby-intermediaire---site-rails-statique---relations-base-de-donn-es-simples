# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Director.destroy_all

movies = [
  ['The Evil Dead', 1981],
  ['Reservoir Dogs', 1992],
  ['Evil Dead 2', 1983],
  ['At the end John dies', 2012],
  ['1 Night in Paris', 2004]
]

directors = [
  %w[Sam RAIMI],
  %w[Quentin TARANTINO],
  %w[Don WONG],
  %w[Rick SALOMON]
]

relations = [
  1, 2, 1, 3, 4
]

directors.each do |director|
  Director.create(first_name: director[0], last_name: director[1])
end

movies.each do |movie|
  Movie.create(title: movie[0], release_year: movie[1])
end

i = 1

relations.each do |relation|
  temp_movie = Movie.find(i)
  temp_director = Director.find(relation)
  temp_movie.director_id = temp_director.id
  i += 1
  temp_movie.save
end
