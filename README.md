# Simple decorator

A simple sitemesh-like rack filter for Rails apps

This gem lets you specify a url to a place to fetch the layout for your application using a method in you controllers.

## Installation

In your Gemfile

    gem 'simple_decorator'


Create a decorator lets say at 'http://www.mysite.com/decorator' containing your site's layout:
  
    <html>
      <head>
        <title>$title - SiteName</title>
        $head
      </head>
      <body>
        <div class="somestyling">
          $body
        </div>
      </body>
    </html>

In your layout file (typically application.html.erb)

    <html>
      <head>
        <title>My apps page</title>
        <link rel="stylesheet" href="my_app_styles.css" type="text/css" media="screen" />
      </head>
      <body>
        <h1>My apps dynamic response</h1>
      </body>
    </html>

In any controller
    
    # usually you put this in your ApplicationController
    # but feel free to override in any other controller
    def decorator_url
      "http://www.mysite.com/decorator"
    end


The response will now have the layout of your decorator, but display dynamic contents from your app, including your stylesheets and javacripts

    <html>
      <head>
        <title>My apps page - SiteName</title>
        <link rel="stylesheet" href="my_app_styles.css" type="text/css" media="screen" />
      </head>
      <body>
        <div class="somestyling">
          <h1>My apps dynamic response</h1>
        </div>
      </body>
    </html>

## Code status

[![Code Climate](https://codeclimate.com/github/bring/kp-simple-decorator.png)](https://codeclimate.com/github/bring/kp-simple-decorator)
