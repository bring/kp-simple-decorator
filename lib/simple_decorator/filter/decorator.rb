require 'rack-plastic'
require 'open-uri'

module SimpleDecorator
  module Filter
    class Decorator < Rack::Plastic
      def change_html_string(html)
        return html unless request.env["simple_decorator.layout.url"]
        return html if request.xhr?

        layout = request.env["simple_decorator.layout.url"]
        
        decorator = open(layout, :proxy => nil).read
        weaver = ResponseWeaver.new(decorator)
        weaver.apply(html)
      end
    end
  end
end