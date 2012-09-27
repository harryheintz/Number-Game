module Implementation
  class Web < Sinatra::Base
    module Views
      class Layout < Mustache
        def title
          @title || "Eventually, I will be a number game."
        end
      end
      class Home < Layout
        def content
          "Welcome to the Number Game."
        end
      end
      class About < Layout
        def content
          "This is some content."
        end
      end
      class Account < Layout
        def name
          "Bob Franks"
        end
      end
      class Graphics < Layout
        def graphics
          "Any string"
        end
      end
      class Andyho < Layout
        def anything
          "Basic Java Scripting test w/API"
        end
      end
    end
  end
end