User.create!(
    first_name: "Aliaksei",
    last_name:  "Shvants",
    email: "ashvants91@gmail.com",
    password:              "rubyonrails",
    password_confirmation: "rubyonrails",
    admin: true
)

10.times do |n|
   first_name  = Faker::Name.first_name
   last_name  = Faker::Name.last_name
   email = "example-#{n+1}@railstutorial.org"
   password = "password"

   user = User.create!(
       first_name:            first_name,
       last_name:             last_name,
       email:                 email,
       password:              password,
       password_confirmation: password
   )

  name = "#{Faker::App.name} App"
  summary = "Create a simple #{Faker::ProgrammingLanguage.name} application for #{Faker::Job.title}"
  start_date = Faker::Time.between(6.months.ago, 6.months.after, :morning)
  end_date = Faker::Time.between(start_date, 1.months.after, :evening)

  project = Project.create!(
      name:       name,
      summary:    summary,
      start_date: start_date,
      end_date:   end_date
  )

  title = "Install #{Faker::ProgrammingLanguage.name} environment"
  description = "Look for and install stable versions of libraries and dependencies"
  status = "NEW"
  project_id = project.id
  user_id = user.id

  Task.create!(
      title:       title,
      description: description,
      status:      status,
      project_id:  project_id,
      user_id:     user_id
  )
end

