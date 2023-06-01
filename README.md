# This guide will walk you through the steps to set up Ruby and Rails environment. By following these instructions, you will be able to install Ruby and Rails on your machine.

# Step 1: Install Ruby

Install Ruby using a version manager. We recommend using rbenv or rvm to manage your Ruby versions. Choose one of the following options:

# Using rbenv:

# rbenv install <ruby_version>
Verify that Ruby is installed correctly by running ruby --version

Using rvm:
# rvm install <ruby_version>

# rvm use <ruby_version>

Ruby should now be successfully installed on your machine. Proceed to the next step to install Rails.

# Step 2: Install Rails

Install Rails using the following command:
# gem install rails

Verify that Rails is installed correctly by running the following command:
# rails --version

Install all the packages mentioned in the gemfile, use below command:

# bundle install

Create database using below command:
# rails db:create

Do migration using commnad:
# rails db:migrate

Start the rails server using commnad:
# rails s