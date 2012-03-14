module Mesh
  class Railtie < Rails::Railtie
    initializer "mesh.configure_rails_initialization" do |app|
      app.middleware.use Mesh::Filter::Decorator
    end
  end
end