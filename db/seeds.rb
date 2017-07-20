Signup.create!(first_name:  "Example",
  last_name: "User",
			   email: "example@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  first_name  = Faker::First_name.first_name
  last_name = Faker::Last_name.last_name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  Signup.create!(first_name:  first_name,
    last_name: last_name,
                 email: email,
               password:              password,
               password_confirmation: password)
end