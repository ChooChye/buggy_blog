# Buggy Blog

A small Rails blog with articles, categories, title search, URL slugs, and
draft/published articles. Pages are server-rendered with ERB; there is no
JavaScript framework.

Your task is described in [CANDIDATE_TASKS.md](CANDIDATE_TASKS.md).

## Requirements

- Ruby 3.4.8 (see `.ruby-version`; rbenv, asdf, mise, or chruby will pick it up)
- Bundler (`gem install bundler` if it is missing)
- PostgreSQL 14 or newer, running locally

## Setup

```sh
bundle install
bin/rails db:prepare   # creates the databases, loads the schema, and seeds sample data
bin/dev                # starts the server on http://localhost:3000
```

`bin/setup` runs the same steps (install, prepare the database, start the server).

### Database connection

`config/database.yml` uses the PostgreSQL defaults: a local server and a role
named after your operating-system user. If your setup is different, use the
standard PostgreSQL environment variables, for example:

```sh
export PGHOST=localhost
export PGUSER=postgres
export PGPASSWORD=postgres
```

Or point Rails at a full connection URL:

```sh
export DATABASE_URL=postgres://postgres:postgres@localhost:5432/buggy_blog_development
```

The databases used are `buggy_blog_development` and `buggy_blog_test`.

## Sample data

`bin/rails db:prepare` seeds the database the first time it is created.
The seed script is safe to run again at any time:

```sh
bin/rails db:seed    # adds any missing sample records, never duplicates them
bin/rails db:reset   # drops, recreates, and re-seeds the development database
```

The seed data contains three categories (Technology, Food, Travel) and six
articles, some published and some drafts.

## Running the tests

```sh
bin/rails test
```

Tests use Minitest, which ships with Rails. Fixtures live in `test/fixtures`.

## Useful URLs

| Page | URL |
| --- | --- |
| Home | `/` |
| Articles (with search) | `/articles` |
| One article | `/articles/:id` |
| Categories | `/categories` |
| Articles in a category | `/categories/:id/articles` |
