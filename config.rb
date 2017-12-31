activate :directory_indexes

set :relative_links, true
::Slim::Engine.set_options format: :html

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/404.html", directory_index: false

set :css_dir, "assets/stylesheets"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"

configure :development do
  ::Slim::Engine.set_options pretty: true
end

configure :build do
  activate :external_pipeline,
    name: :gulp,
    command: "npm run production",
    source: ".tmp",
    latency: 1

  ignore "assets/javascripts/all.js"
  ignore "assets/stylesheets/site"

  activate :gzip

  ::Slim::Engine.set_options pretty: false

  activate :minify_html do |html|
    html.remove_quotes = false
    html.remove_intertag_spaces = true
  end
end
