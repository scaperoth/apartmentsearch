# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: ENV['ADMIN_USER'], password: ENV['ADMIN_USER_PASS'], password_confirmation: ENV['ADMIN_USER_PASS'], admin: true)

# seed the statuses
statuses = ActiveSupport::JSON.decode(File.read('db/seed_files/statuses.json'))
statuses.each do |s|
    Status.create(s)
end

# seed the apartments
apartments = ActiveSupport::JSON.decode(File.read('db/seed_files/apartments.json'))
apartments.each do |a|
    status = Status.find(a["status"])
    a["status"] = status
    Apartment.create(a)
end

# to fix broken unique identifier error
# sql = "SELECT setval('apartments_id_seq', (SELECT max(id) FROM apartments))"
# ActiveRecord::Base.connection.execute(sql)
# sql = "SELECT setval('statuses_id_seq', (SELECT max(id) FROM statuses))"
# ActiveRecord::Base.connection.execute(sql)
# sql = "SELECT setval('users_id_seq', (SELECT max(id) FROM users))"
# ActiveRecord::Base.connection.execute(sql)


