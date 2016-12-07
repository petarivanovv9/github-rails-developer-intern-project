# Rails Developer Intern Interview Exercise

## Welcome

Hi, and thanks for applying for the __Rails Developer Intern__ position with the [GitHub Education](https://education.github.com) team.

This exercise is designed to give you an opportunity to show off programming skills that would be relevant to work on [GitHub Classroom](https://classroom.github.com) ([source](https://github.com/education/classroom)).

## Exercise instructions

Please use this repository to develop a simple [Ruby on Rails](http://rubyonrails.org) application that allows a user to log in with GitHub. Once authorized, the application should display the public profile information and persist the `access_token`. You should make sure to always display up-to-date profile information.

You can find all the information you need about the GitHub API on the [GitHub Developer](https://developer.github.com/) site.

## Evaluation

Your submission will be evaluated against the following criteria:

* Meets the stated requirements
* Code is high quality, well organized, and secure
* Best practices are followed including:
  * Version control
  * Iterative development
  * Automated testing
  * Build scripts

## Submission

To submit your work, please deploy your application to [Heroku](https://heroku.com) using the free tier and email us a link to your app deployed in production along with a link to your repository to let us know you're ready to have us take a look at your code.

## Get started

@education-interview-exercises/rails-developer-intern-reviewers team and @johndbritton

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
