# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Ram R Sujith",
             email: "rxr5511@louisiana.edu",
             password:              "Eaglerun1#",
             password_confirmation: "Eaglerun1#", admin: true, normuser: true)

User.create!(name:  "Bhaskar Ghosh",
             email: "bxg0564@louisiana.edu",
             password:              "Ullafayette#25",
             password_confirmation: "Ullafayette#25", admin: false, normuser: true)
             
User.create!(name:  "Vinay M Israni",
             email: "vmi9219@louisiana.edu",
             password:              "vincyOutlook1!",
             password_confirmation: "vincyOutlook1!", admin: false, normuser: true)
             
User.create!(name:  "Aditya Kaveeshwar",
             email: "ark5895@louisiana.edu",
             password:              "Padmanabh12#",
             password_confirmation: "Padmanabh12#", admin: false, normuser: true)
