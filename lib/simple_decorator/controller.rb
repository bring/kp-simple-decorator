module SimpleDecorator
  module Controller
    ## this one manages the usual self.included, klass_eval stuff
    extend ActiveSupport::Concern

    included do
      after_filter :call_decorator_url
    end

    
    def call_decorator_url
      return unless respond_to? :decorator_url

      request.env['simple_decorator.layout.url'] = decorator_url
      
    end
  

  end
end

::ActionController::Base.send :include, SimpleDecorator::Controller