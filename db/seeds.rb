# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(title: 'USB Raketenwerfer',
                description: %{<p>Der USB Raketenwerfer verfügt über 4 Raketen aus Schaumstoff, die Computer gesteuert abgefeuert werden können.</p>},
                image_url: 'http://www.getdigital.de/web/getdigital/gfx/products/__generated__resized/1100x1100/Raketenwerfer_gruen_main-2.jpg',
                price: 34.0)
Product.create!(title: 'Arizona Green Tea',
                description: %{<p>heute billig morgen teuer</p>},
                image_url: 'http://www.simplysoup.ch/image/cache/data/soup/arizona%20green%20tea-900x900.jpg',
                price: 34.0)
Product.create!(title: 'CoffeeScript',
                description: %{<p>CoffeeScript is JavaScript done right. It provides all of JS's functionality...</p>},
                image_url: 'http://talks.codegram.com/images/brew-your-own-coffeescript/coffeescript.png',
                price: 34.0)