module CustomHtmlMatcher
  class HaveSameMarkup
    def initialize(expected)
      @expected = expected
    end

    def matches?(target)
      @target = target
      normalize_whitespaces(@target).eql?(normalize_whitespaces(@expected))
    end
    def failure_message
      "expected #{@target} to match #{@expected}"
    end
    def negative_failure_message
      "expected #{@target} not to match #{@expected}"
    end
    
    private
    def normalize_whitespaces(str)
      str.gsub(/\s+/, ' ') #replace all whitespace occurences with just once space
    end
  end


  def be_same_markup(expected)
    HaveSameMarkup.new(expected)
  end
end