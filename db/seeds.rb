# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

datafile = Rails.root + 'db/import.csv'

i=1

CSV.foreach(datafile, headers: true) do |row|

  Article.find_or_create_by({id: row[0]}) do |hr|
    if hr.id.present?
      hr.id = row[0]
      hr.title =  row[1]
      hr.description =  row[2]
      hr.author = Author.where(email: "fakemail#{i}@mail.com").first_or_create(name: row[3], password_digest: "")
      hr.all_tags =  row[4]
      hr.created_at =  row[5]
      hr.updated_at =  row[6]
      i+=1
    end
  end

end
