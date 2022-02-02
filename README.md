# Okr App

## Technology stack

### Backend

- [Ruby](https://www.ruby-lang.org/de/) 3
- [Ruby on Rails](https://rubyonrails.org/) 6
- [PostgreSQL](https://www.postgresql.org/) for using as SQL database

### Development

- [dotenv](https://github.com/bkeepers/dotenv) to load environment variables from .env into ENV

### Linting and testing

- [RuboCop](https://rubocop.org/) for Ruby static code analysis

### Deployment

- [Docker](https://www.docker.com/) for production deployment, NOT for development
- [GitHub Actions](https://docs.github.com/en/actions) for testing, linting, and building Docker image

### Production

- [Lograge](https://github.com/roidrage/lograge) for single-line logging

## Getting started

### Development installation

1. Clone the repo locally:

```bash
git clone git@github.com:valdrinkuchi/okr_app.git
cd okr_app
```

2. Install PostgreSQL. On a Mac with HomeBrew, run this to install from the `Brewfile`:

```bash
brew bundle
```

3. Setup the application to install gems and create the database:

```bash
bin/setup
```

4. Setup Database. The `seed.rb` file has dummy data to get started.

```bash
rails db:setup
```

5. Start the application locally:

```bash
rails s
```

### Running in production mode locally

```bash
docker-compose up
```

### Running tests

1. Run Ruby tests:

```
bin/rails test
```

2. Run RuboCop:

```
bin/rubocop
```

### Examples

In the `seed.rb` there are two users created and assigned `Goals and Key Results`.
When `Emma Doe` with email `emma.doe@test.com` and password `123456` is signed_in
through `POST` `http://0.0.0.0:3000/api/v1/sessions` the authorization token is received in the response.
This token can be used to retrieve `Goals and Key Results` that belong to Emma through `http://0.0.0.0:3000/api/v1/key_results`
and `http://0.0.0.0:3000/api/v1/goals`.
