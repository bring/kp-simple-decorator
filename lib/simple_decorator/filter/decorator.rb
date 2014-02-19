require 'rack-plastic'

module SimpleDecorator
  module Filter
    class Decorator < Rack::Plastic
      def change_html_string(html)
        return html unless request.env["simple_decorator.layout.url"]
        return html if request.xhr?

        url_or_hash = request.env["simple_decorator.layout.url"]
        
        decorator = Fetcher.new(:proxy => nil).fetch(url_or_hash)

        weaver = ResponseWeaver.new(decorator)
        weaver.apply(html)
      end
    end
  end
end