# Rails Developer Intern Interview Exercise

## Get started

The application is deployed in production to Heroku and it's located [here] (https://gryphon-github-intern.herokuapp.com)

### 1. Installing a Local Server

* First, you need to install Ruby 2.3.3
* Next, you need to have PostgreSQL installed
* Now, let's install the gems
```bash
gem install bundler && rbenv rehash
```

### 2. Setup the project

* You should have PostgreSQL correctly configured
* Run the `setup` script:
```
script/setup
```
* Fill out your `.env` file (created by `script/setup`).

ENV Variable | Description |
:-------------------|:-----------------|
`GITHUB_CLIENT_ID`| the GitHub Application Client ID.
`GITHUB_CLIENT_SECRET`| the GitHub Application Client Secret.
`TEST_GITHUB_TOKEN` | The [Personal Access Token](https://github.com/blog/1509-personal-api-tokens) for the user (only for testing or running the specs)

#### Testing the application

You can run the specs with:
```bash
script/test
```

You can run the linters (tools that flags suspicious usage in software written in any computer language) with:
```bash
script/linter
```

#### Running the application

You may start the rails server with:
```bash
script/server
```

That's it! You should have a working instance of the project located [here] (http://localhost:3000)
