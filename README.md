# East Bay DSA website

This project aims to replace the existing NationBuilder-backed site with a
new website built in Rails, that gives us an easy platform for technical
volunteers to join, and a solid foundation for building advanced features
going forward.

## Getting Started

Dependencies:

* Ruby >= 2.4.0
* Postgres (postgresapp.com is a great option here)
* bundler (gem install bundler)
* foreman (gem install foreman)

### First time setup

Clone the repository source to local machine:

```sh
git clone git@github.com:eastbaydsa/website.git ebdsa-website
cd ebdsa-website
```

In the cloned directory, install your gem dependencies with `bundler`:

```sh
bundle install
```

Create your database and run migrations:

```sh
bin/rake db:setup
```

And start your local server with `foreman`:

```sh
foreman start
```

Your site will be available at http://localhost:5000

## Deployment

TBD but probably Heroku
