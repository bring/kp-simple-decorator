module SimpleDecorator
  class Railtie < Rails::Railtie
    initializer "simple_decorator.configure_rails_initialization" do |app|
      app.middleware.use SimpleDecorator::Filter::Decorator
    end
  end
end