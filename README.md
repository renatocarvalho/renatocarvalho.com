renatocarvalho.com
=====================

My personal site built with Middleman 4 + Gulp.js template.

Requirements
------------

* [Middleman 4.x][middleman-docs]
* [Ruby 2.x][rbenv]
* [Node 6.x][nvm]
* [Gulp CLI][gulp-cli]

Environments
------------

Middleman has two default environments: `development` and `production`. This template is configured to run the external pipeline (Gulp in our case) in both. There are times, however, when the external pipeline should not run. Two good examples are tests and the console. We therefore define two additional environments: `test` and `console`.

Custom environments can be invoked on the command line with `-e` flag like so:

    # Start the console in the console enviroment
    $ bundle exec middleman console -e console

Code for custom environments is stored in `environments/<your-custom-env>.rb`. Note that custom environments can be invoked without the existence of a corresponding file in the `environments/` directory. If, for example, you merely wanted to start a server without the default `development` configs, you could run `middleman server -e <anything-here>`.

For completeness, all five environments used in this template have corresponding files:

```sh
environments/
├── console.rb
├── development.rb
├── production.rb
├── staging.rb
└── test.rb
```

Middleman vs. Gulp
------------------

As I initially experimented with Gulp and Middleman, it was sometimes difficult to determine which tool should handle which tasks. The problem is that, while Gulp and Middleman are very different, they have a fair amount of overlapping functionality. For example, Middleman can [minify your CSS and JavaScript][minify-css-js] right out of the box. So can Gulp. Middleman can also minify your [HTML][minify-html], [gzip your files][gzip], and automatically reload your browser using [LiveReload][livereload]. And Gulp can do [all][gulp-clean-css] [these][gulp-uglify] [things][gulp-htmlmin] [too][gulp-livereload].

So how do you decide who does what? I think most people would be inclined to have Gulp do it all. That's what it was designed for, and it makes sense to keep all these asset-related tasks in one place. However, since we're using Gulp inside of Middleman - a robust static site generator - I think there are some tasks that are better left to Middleman. Here's how I've broken it down in this template:

| Middleman       | Gulp              |
| --------------- | ----------------- |
| HTML Templating |                   |
| Minify HTML     |                   |
| Gzip Files      |                   |
|                 | Preprocess CSS    |
|                 | Minify CSS        |
|                 | Minify Javascript |
|                 | Sourcemaps        |
|                 | Autoprefixer      |
|                 | Bundle JavaScript |
|                 | Compress Images   |
|                 | Copy web fonts    |
|                 | Browser Reload    |

Tests
-----

Testing is done with Rspec. A few basic tests are provided as an example. Run your test suite like so:

    $ bin/rspec spec/

Aliases
-------

Consider adding the following to your `.bashrc` or `.zshrc` file:

```sh
mm='bundle exec middleman'
mmb='bundle exec middleman build --clean'
mmc='bundle exec middleman console -e console'
mms='bundle exec middleman server'
```

Acknowledgements
----------------

This website was created based on Middleman 4 + Gulp.js template.

- [https://github.com/joshukraine/middleman-gulp](https://github.com/joshukraine/middleman-gulp)


License
-------

Copyright &copy; 2018 Renato Carvalho. [MIT License][license]
