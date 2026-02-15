# Rails Tabler Starter Template
# Usage: rails new myapp -m https://raw.githubusercontent.com/tarunvelli/rails-tabler-starter/main/template.rb
#
# This template clones the full starter repo after creating a base Rails app

# Remove the default Rails app files to replace with starter
run "rm -rf app/*"
run "rm -rf config/*"
run "rm -rf db/migrate/*"
run "rm -rf lib/*"
run "rm -rf spec/*"
run "rm -rf bin/*"
run "rm -rf public/*"

# Clone the starter repo
run "git clone --depth 1 https://github.com/tarunvelli/rails-tabler-starter.git .starter_tmp"

# Copy starter files (selectively)
run "cp -r .starter_tmp/app app/"
run "cp -r .starter_tmp/config config/"
run "cp -r .starter_tmp/db db/"
run "cp -r .starter_tmp/lib lib/"
run "cp -r .starter_tmp/spec spec/"
run "cp -r .starter_tmp/bin bin/"
run "cp -r .starter_tmp/public public/"

# Copy root files we want to keep from starter
run "cp .starter_tmp/Gemfile ."
run "cp .starter_tmp/Gemfile.lock ."
run "cp .starter_tmp/Rakefile ."
run "cp .starter_tmp/config.ru ."
run "cp .starter_tmp/.ruby-version ."
run "cp .starter_tmp/package.json ."
run "cp .starter_tmp/yarn.lock ."
run "cp .starter_tmp/.rspec ."
run "cp .starter_tmp/.rubocop.yml ."
run "cp .starter_tmp/Procfile.dev ."
run "cp .starter_tmp/.env.sample ."
run "cp .starter_tmp/README.md ."
run "cp .starter_tmp/license ."
run "cp -r .starter_tmp/.github ."
run "cp -r .starter_tmp/.kamal ."
run "cp -r .starter_tmp/.dockerignore ."
run "cp -r .starter_tmp/Dockerfile ."

# Cleanup
run "rm -rf .starter_tmp"

# Install dependencies
run "bundle install"
run "yarn install"

# Setup database
rails_command "db:create", env: "development"
rails_command "db:migrate"

# Precompile assets
run "rails assets:precompile"

# Initialize git
git :init
git add: "."
git commit: %(-m 'Initial commit - Rails Tabler Starter')

puts "\n" + "="*50
puts "Rails Tabler Starter installed successfully!"
puts "Run ./bin/dev to start the development server"
puts "="*50
