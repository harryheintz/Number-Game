module Implementation
  class Web < Sinatra::Base
    module Views
      class Layout < Mustache
        def title
          @title || "Number Game Test."
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
          "Insert your graphics code here."
        end
      end
    end
  end
end