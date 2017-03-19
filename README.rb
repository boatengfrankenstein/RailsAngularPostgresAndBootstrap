Rails-Angular-Postgres-and-Bootstrap eBook
https://s3-ap-southeast-1.amazonaws.com/mylekha-ebook/IT+%26+Programming/html_css_javascript/Rails-Angular-Postgres-and-Bootstrap.pdf

$ rails new --skip-turbolinks  --skip-spring  --skip-test-unit -d postgresql  shine
vvvvv Set up prostres for my rails app "shine" on c9 as follows:vvvvvvvvvvvvvv 
(following http://stackoverflow.com/a/29379969/5521564219)
How to setup PostgreSQL & Rails on Cloud9
At time of writing, Cloud9 has PostgreSQL pre-installed, so you won't need to install it yourself. However, its not running by default, so you will need to start it with this command in the terminal:
$ sudo service postgresql start
Change the PostgreSQL password to 'password' (or choose a different password):
$ sudo sudo -u postgres psql
# This will open the psql client.
# Type \password and press enter to begin process
# of changing the password:
postgres=# \password
# Type your new password (e.g. "password") and press enter twice:
Enter new password: 
Enter it again: 
# Password changed, quit psql with \q
postgres=# \q 
Edit your config/database.yml to be:
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  # Important configs for cloud9, change password value
  # to what you entered in the previous psql step.
  template: template0
  username: ubuntu
  password: password
development:
  <<: *default
  database: your_app_name_development
test:
  <<: *default
  database: your_app_name_test
production:
  <<: *default
  database: your_app_name_production
  username: your_app_name
  password: <%= ENV['YOUR_APP_NAME_DATABASE_PASSWORD'] %>
(Note the template, username, and password configs in the default section above are essential).
Add the pg gem to your Gemfile:
gem 'pg'
Run bundle install.
Remove the sqlite gem from your Gemfile (and optionally delete the db/*.sqlite3 files)
Create the database, load schema.rb, and seed the database using the db:setup task:
bundle exec rake db:setup
# Run bin/rake -AD db to see all db-related tasks
Start or restart your rails app and check it is working.
Note, the non-seed data from your old sqlite database will not be present in the new database.
If you ever want to use the psql client to interact with PostgreSQL directly, in the terminal run psql or run bin/rails db.
sudo service postgresql start
----------------------------------------------------------------------------

 you’ll need to create a user 
 Our user will be named shine and have the password shine. 
 We can create it using the command-line app installed with Postgres called createuser. 
 $ createuser --createdb --login -P shine 
 You’ll be prompted for a password, so enter shine twice.
 ( you can also create a user inside Postgres directly. 
 You’ll need to access the postgres schema, 
 which you can usually do with psql like so: 
 $ psql postgres
 postgres> CREATE USER shine PASSWORD 'shine')
)
Next, modify config/database.yml so the app can connect to the database. 
default: &default 
adapter: postgresql 
encoding: unicode 
host: https://ucast-timchen7.c9users.io/
username: shine➤ p
password: shine➤ p
pool: 5

Next, we’ll set up our database. 
$ bundle exec rake db:create 
$ bundle exec rake db:migrate 
$ rails s -b $IP -p $PORT
---> see "rails welcome page" on https://ucast-timchen7.c9users.io/ OK!!!
===================== above: 1st commit ===============================
edit login/create-dashboard/shine/config/routes.rb 
  root 'dashboard#index'
create app/controllers/dashboard_controller.rb.
create app/views/dashboard/index.html.erb
install Devise gem :
  gem 'devise'
$ bundle exec rails generate devise:install 
  create config/initializers/devise.rb 
  create config/locales/devise.en.yml
$ bundle exec rails generate devise user 
  invoke active_record 
  create db/migrate/20150228234349_devise_create_users.rb 
  create app/models/user.rb 
  insert app/models/user.rb 
    route devise_for :users
