# Simple decorator

A simple sitemesh-like rack filter for Rails apps

This gem lets you specify a url to a place to fetch the layout for your application using a method in you controllers.

## Installation

In your Gemfile

    gem 'simple_decorator', '0.0.1', git: 'git://github.com/Posten-konsernportal/simple_decorator.git'

In any controller
    
    # usually you put this in your ApplicationController
    # but feel free to override in any other controller
    def simple_decorator_url
      "some url to a velocity style decorator"
    end