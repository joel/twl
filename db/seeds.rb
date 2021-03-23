# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AUTHORIZED_ENVS = %w[development]
if !AUTHORIZED_ENVS.include?(Rails.env)
  raise "You can't seed in [#{Rails.env}]"
end

require "ffaker"

prng = Random.new

prng.rand(10..100).times.map do
  Post.create({title: FFaker::Book.title, body: FFaker::Book.description})
  print(".")
end

puts("done!")
