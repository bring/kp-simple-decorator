require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ResponseWeaver do

  it "should strip out placeholders in response" do
    response = ResponseWeaver.new('<html>$some_placeholder</html>').apply('Jadajada')
    response.should == "<html></html>"
  end

  it "should inject a tag from apply to placeholder with matching name" do
    response =
      ResponseWeaver.new('<html><head><script scr="http://jquery.com/jquery.js"/>$head</head><body></body></html>').
      apply('<html class="bladi"><head><title>should be applied</title></head><body></body></html>')

    response.should == '<html><head><script scr="http://jquery.com/jquery.js"/><title>should be applied</title></head><body></body></html>'
  end

  it "should be case insensitive when injecting tags into placeholders" do
    response =
      ResponseWeaver.new('<Html><head>$HEad</head><body></body></html>').
      apply('<HTML><HEAD>MYHEADCONTENT</head><body></body></html>')
    response.should == '<Html><head>MYHEADCONTENT</head><body></body></html>'
  end

  it "should match tags for placeholders even when the tags have attributes" do
    response =
      ResponseWeaver.new('<html><head></head><body>$body</body></html>').
      apply('<html><head></head><body class="my-class" id="myID">The body content</body></html>')

    response.should == '<html><head></head><body>The body content</body></html>'
  end

  it "should match multiline responses" do
    response =
      ResponseWeaver.new(%{
        <html>
          <head>
            <script scr="http://jquery.com/jquery.js"></script>
            <meta name="description" value="blasbdlasbd"/>
            $head
          </head>
          <body>
            Some body
            $body
          </body>
        </html>
      }).
      apply(%{
        <html>
          <head>
            <head_tag_to_be_applied/>
          </head>
          <body>
          </body>
        </html>
      })

    response.should be_same_markup(%{
      <html>
        <head>
          <script scr="http://jquery.com/jquery.js"></script>
          <meta name="description" value="blasbdlasbd"/>
          <head_tag_to_be_applied/>
        </head>
        <body>
          Some body
        </body>
      </html>
    })
  end

  it "should remove nested tags that apply to other placeholders" do
    response =
      ResponseWeaver.new(%{
        <html>
          <head>
            <title>$title</title>
            $head
          </head>
          <body></body>
        </html>
      }).apply(%{
        <html>
          <head><title>This should appear once</title>
          </head>
          <body></body>
        </html>
      })
    response.should be_same_markup(%{
      <html>
        <head>
          <title>This should appear once</title>
        </head>
        <body></body>
      </html>
    })
  end

end
