module Mesh
  module Controller
    ## this one manages the usual self.included, klass_eval stuff
    extend ActiveSupport::Concern

    included do
      after_filter :call_mesh_layout_url
    end

    
    def call_mesh_layout_url
      return unless respond_to? :mesh_layout_url

      request.env['mesh.layout.url'] = mesh_layout_url
      
    end
  

  end
end

::ActionController::Base.send :include, Mesh::Controller