require 'rack-plastic'

module SimpleDecorator
  module Filter
    class Decorator < Rack::Plastic
      def change_html_string(html)
        p request.env
        return html unless request.env["simple_decorator.layout.url"] || request.env["HTTP_X_EACCESS_USERID"]
        return html if request.xhr?

        layout_url = request.env["simple_decorator.layout.url"]
        
        decorator = Fetcher.new(:proxy => nil).fetch(layout_url)

        weaver = ResponseWeaver.new(decorator)
        weaver.apply(html)
      end
    end
  end
end