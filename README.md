# Skeddit

Skeddit is a modular event planner and scheduler created in Ruby on Rails. Its simplistic design makes it easy to navigate, create, view, join, and manage your events. Skeddit supports account creation, and it can run on any machine with access to the same database, and find the same events.

[Website](http://skeddit.gitgud-ku.com)

### Team Members

[Gage Benne](https://github.com/gagebenne) 
* Database, Models, Login Page

[Zachary Bruennig](https://github.com/zbruennig)
* Validation, Error Checking, QA, Controllers

[Andy Monroe](https://github.com/andrew-monroe)
* Documentation and Project Generator, resident Rails Guru 

[Mason Wilde](https://github.com/masonwilde)
* UI, CSS, Views


# Installation

### Prerequisites

Skeddit was built with Ruby 2.4.1, Rails 5.1.4, and Postgres 9.6.5. Previous versions may be unsupported.

To set up Rails with Postgres, follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres).

### Configuration

Once your Rails environment is set up, run `git clone https://github.com/GitGud-KU/Skeddit.git`

Then, add your database settings into the config/database.yml file.

Finally, run `rake db:create` then `rake db:migrate`.

With the databse set up, Skeddit should be ready to run! Type `rail s` to launch the app.

### Works Cited/Libraries Used:

[Rails](http://rubyonrails.org/)

[Bootstrap](http://getbootstrap.com/)

[Bootswatch](https://bootswatch.com/)

[Gemfile Gems](https://github.com/GitGud-KU/Skeddit/blob/master/Gemfile)

[Devise](https://github.com/plataformatec/devise)

[Simple Form](https://github.com/plataformatec/simple_form)

# Documentation

### How to View Automatically Generated HTML Documentations

Clone the Skeddit repository to your computer.

Open documentation/git_gud_documentation/index.html to browse the code that we wrote.

Open documentation/full_app_documentation/index.html to browse the code for this entire app.
