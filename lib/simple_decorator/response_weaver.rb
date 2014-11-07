class ResponseWeaver

  def initialize(decorator)
    @init_time = Time.now
    @decorator = decorator
    @placeholders = build_placeholders(decorator)
    @fields = keys(@placeholders)
  end

  def apply(response)
    response_array = @placeholders

    @fields.each do |tag_name|
      content_for_tag = extract_from_response(response, tag_name)

      #<title> is nested within <head>, so we will have to remove the <title> tag from the head placeholder
      content_for_tag = remove_nested_tags(content_for_tag)
      response_array[response_array.index("$#{tag_name}")] = content_for_tag
    end

    #build a response string from the array
    ret = ''
    response_array.each { |str| ret << str }

    #puts "time since init: #{Time.now - @init_time} "
    ret
  end


  private

  def remove_nested_tags(content)
    @fields.each do |tag_name|
      content = content.gsub(/<#{tag_name}[^>]*>.*<\/#{tag_name}>/im, '')
    end
    content
  end

  def extract_from_response(response, tag_name)
    matchdata = /<#{tag_name}[^>]*>(.*)<\/#{tag_name}>/im.match(response)
    if matchdata
      matchdata[1]
    else
      ""
    end
  end

  # returns an array containing the enire page, but splitted with keys as separate elements
  # ['<some body html>' , '$title', '<morebody>', '$head', '<more body>']
  def build_placeholders(template_string)
    template_string.split(/(\$[\w]+)/)
  end

  def keys(page_array)
    ret_keys = []
    page_array.each {|elem| ret_keys << keyname(elem) if key?(elem)}
    ret_keys
  end

  def key?(str)
    str.start_with?('$')
  end

  def keyname(str)
    str.gsub(/\$/, '')
  end
end
