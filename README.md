# Ruby on Rails: NoTengoBlog [Demo]

> A "blog" website built from scratch using Ruby on Rails. It allows image uploading, user registration, and it's internationalized in several languages. It shows both local articles from the database and articles gathered from an external API.

![screenshot](./doc/screenshot.gif)

This project is a demo website for a blog-like page with user registration, authorization, authentication, external API resources, and internationalization. The website uses Ruby on Rails with PostgreSQL as the back-end stack, with `webpack`, semantic HTML, and SASS for the front-end.

The `Article` model is CRUDful, and the user handling by the `devise` gem. The database for development and test is SQLite3 and for production is PostgreSQL. This configuration is a design choice to allow the tests to run in the GitHub Workflow environment.

A customized version of Bootstrap, compiled from SASS via WebPack, is the front-end framework. The project uses a set of custom fonts carefully selected to be freely available, beautiful, and elegant. The fonts are self-hosted using the WebPack assets pipeline.

For this application, the latest version of WebPack is the asset pipeline, instead of Rail's Sprockets. Active Storage also serves the assets, specially user-uploaded assets. I decided to make the most of WepPack's modern architecture to compress, clean, and optimize CSS and JS assets for optimal network performance.

## Built With

-   [Ruby on Rails](https://rubyonrails.org/)
-   [bootstrap](https://getbootstrap.com/)
-   [sass](https://sass-lang.com/)
-   [stylelint](https://stylelint.io/)
-   [Gems](https://rubygems.org/)
    -   [bullet](https://rubygems.org/gems/bullet/)
    -   [capybara](https://rubygems.org/gems/capybara/)
    -   [devise](https://rubygems.org/gems/devise/)
    -   [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails/)
    -   [faker](https://rubygems.org/gems/faker/)
    -   [kaminari](https://rubygems.org/gems/kaminari/)
    -   [mina](https://rubygems.org/gems/mina/)
    -   [rails-i18n](https://rubygems.org/gems/rails-i18n/)
    -   [rest-client](https://rubygems.org/gems/rest-client/)
    -   [rspec](https://rubygems.org/gems/rspec/)
    -   [rubocop](https://rubygems.org/gems/rubocop/)
    -   [shoulda](https://rubygems.org/gems/shoulda/)


## Live Demo

Visit this demo on my website [notengobattery.com](https://blog.demo.notengobattery.com/)

## Getting Started

### Preparing the local environment

For running this program locally, please (skip the installations if you already have the software):

-   [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/)
-   [Install Ruby 3.0](https://www.ruby-lang.org/en/downloads/)
-   [Install PostgreSQL](https://www.postgresql.org/download/)
-   [Install SQLite3](https://sqlite.org/download.html)
-   [Install node.js](https://nodejs.org/en/download/)
-   [Install `yarn` globally](https://docs.npmjs.com/downloading-and-installing-packages-globally/)
-   [Install Vips](https://github.com/libvips/libvips/)

> Note: as discussed below, downloading the source code without `git` is possible.

Get a copy of this project by one of the following methods:

-   By cloning the repository using `git`
    -   `git clone git@github.com:NoTengoBattery/blog-rails.git`
-   By downloading a zip with the source code
    -   Click [here](https://github.com/NoTengoBattery/blog-rails/archive/refs/heads/main.zip) to download a copy of the stable branch
    -   Extract it in a place with easy access to a terminal

Open the terminal and navigate to the folder where the source code is. If you need help navigating using the terminal, please check the following articles:

-   For Windows users, check [this](https://www.technoloxy.com/tutorials/cmd-navigate-view-run/) article.
-   For UNIX/UNIX-like users such as Linux and macOS users, check [this](https://swcarpentry.github.io/shell-novice/02-filedir/index.html) article.

> Note: **all** the following commands should be executed in the project's root directory.

Install the dependencies by running `bundle install`. There may be a need to provide the administrator password. For more information about Ruby's `bundle` tool, please check [here](https://bundler.io/man/bundle-install.1.html).

Prepare the working environment by running the following command: `bundle exec bin/setup`. That command will automatically set up the development environment and finish the installation of the Node.js dependencies.

Delete the `config/credentials.yml.enc` file and create a new set of credentials for the application's local copy. Be ready with the API key for [News API](https://newsapi.org/) for generating the credentials.

Finally, add the API key to the credentials file by running `bundle exec rails credentials:edit`. **Add** it using the following YAML snippet, where `[KEY]` should be replaced with the actual key (without brackets).

```yaml
newsapi:
  api_key: [KEY]
```

### Running

> Note: to test all features, run the development **database seeds**. These seeds will populate the local database with mock objects. This way, the website will behave as it has content. Execute `bundle exec rails db:seed` to generate the simulated objects in the database.

After following the instructions for getting started, execute `bundle exec rails server` for running this project. The command will start the Rails server. Visit the local demo at <http://localhost:3000> (by default).

#### Running the tests

Running the tests is similar to running the server. For this, `bundle` is **required**. Run the test suite by issuing the following command: `bundle exec rspec`.

> Note that the tests may fail depending on the local environment and the API permissions. The GitHub Workflow [Actions](https://github.com/NoTengoBattery/blog-rails/actions/) should be considered proof that the tests are passing.

## Authors

👤 **Oever González**

-   GitHub: [@NoTengoBattery](https://github.com/NoTengoBattery/)
-   Twitter: [@NoTengoBattery](https://twitter.com/NoTengoBattery/)
-   LinkedIn: [Oever González](https://linkedin.com/in/NoTengoBattery/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NoTengoBattery/blog-rails/issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

-   [Hodinkee](https://www.hodinkee.com/) for it's design as inspiration
-   Wei Huang for their astonishing [Work Sans](https://fonts.google.com/specimen/Work+Sans#about) sans-serif font family
-   JetBrains for their amazing [JetBrains Mono](https://fonts.google.com/specimen/JetBrains+Mono#about) monospace font family
-   Frank Grießhammer for their wonderful [Source Serif Pro](https://fonts.google.com/specimen/Source+Serif+Pro#about) serif font family
-   NoTengoBattery for my amazing and time-saving [Rails Template](https://github.com/NoTengoBattery/rails6-webpacker/)

## 📝 License

This project is [MIT-modified](./LICENSE) licensed.
