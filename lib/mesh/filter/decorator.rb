require 'rack-plastic'
require 'open-uri'

module Mesh
  module Filter
    class Decorator < Rack::Plastic
      def change_html_string(html)
        return html unless request.env["mesh.layout.url"]

        layout = request.env["mesh.layout.url"]
        
        decorator = open(layout, :proxy => nil).read
        
        weaver = ResponseWeaver.new(decorator)
        weaver.apply(html)
      end
    end
  end
end