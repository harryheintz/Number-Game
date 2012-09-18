module Implementation
  class Web
    module Views
      class Layout < Mustache
        def title
          @title || "Number Game."
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
    end
  end
end