module SimpleDecorator
  module Controller
    ## this one manages the usual self.included, klass_eval stuff
    extend ActiveSupport::Concern

    included do
      after_filter :call_simple_decorator_url
    end

    
    def call_simple_decorator_url
      return unless respond_to? :simple_decorator_url

      request.env['simple_decorator.layout.url'] = simple_decorator_url
      
    end
  

  end
end

::ActionController::Base.send :include, SimpleDecorator::Controller