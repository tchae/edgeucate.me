require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:username => "example",
                 :name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      username = "user#{n+1}"
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:username => username,
                 :name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
    end  
  end
end