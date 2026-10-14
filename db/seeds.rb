# Seed data for local development.
#
# Safe to run more than once: records are looked up by name/title first,
# so re-running `bin/rails db:seed` does not create duplicates.

technology = Category.find_or_create_by!(name: "Technology")
food = Category.find_or_create_by!(name: "Food")
travel = Category.find_or_create_by!(name: "Travel")

technology.articles.find_or_create_by!(title: "A Beginner's Guide to Ruby on Rails") do |article|
  article.status = "published"
  article.body = <<~TEXT
    Rails is a web framework that favours convention over configuration.
    This guide walks through models, views, and controllers using a small blog as the example.
  TEXT
end

technology.articles.find_or_create_by!(title: "Why We Chose PostgreSQL") do |article|
  article.status = "draft"
  article.body = <<~TEXT
    Notes on why this blog runs on PostgreSQL: reliable transactions,
    good tooling, and helpful features such as case-insensitive matching.
  TEXT
end

food.articles.find_or_create_by!(title: "100% Whole Wheat Sourdough") do |article|
  article.status = "published"
  article.body = <<~TEXT
    A loaf made entirely with whole wheat flour. It takes patience,
    but the flavour is worth the wait.
  TEXT
end

food.articles.find_or_create_by!(title: "Top 100 Hawker Dishes to Try") do |article|
  article.status = "draft"
  article.body = <<~TEXT
    A long list of noodle, rice, and dessert dishes worth queuing for.
  TEXT
end

travel.articles.find_or_create_by!(title: "A Weekend in Kyoto") do |article|
  article.status = "published"
  article.body = <<~TEXT
    Temples in the morning, quiet streets in the afternoon,
    and a very good bowl of ramen at night.
  TEXT
end

travel.articles.find_or_create_by!(title: "Packing Light for Long Trips") do |article|
  article.status = "draft"
  article.body = <<~TEXT
    One bag, a few versatile outfits, and a short checklist.
  TEXT
end

# The editors shortened this article's URL after it was first published.
rails_guide = Article.find_by!(title: "A Beginner's Guide to Ruby on Rails")
rails_guide.update!(slug: "rails-guide") unless rails_guide.slug == "rails-guide"

puts "Seeded #{Category.count} categories and #{Article.count} articles."
