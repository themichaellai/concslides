# Class Note Collaboration

## Installing

Make sure you have [git](http://git-scm.com/book/en/Getting-Started-Installing-Git), [ruby, and rails](http://railsinstaller.org/) installed.

Clone the repository and `cd` into the directory
```bash
git clone git@github.com:themichaellai/notecolab.git
```

Install bundler (skip this step if you're on Windows, I think railsinstaller installs it for you)
```bash
gem install bundle
```
Install all required gems
```bash
bundle install --without-production
```

Initialize database
```bash
rake db:migrate
```

Run the server
```bash
rails s
```

Point your browser to `localhost:3000`
