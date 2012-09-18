# Number Guessing Game

This is a little example application using the premise of a number guessing game to show how you can use Ruby and Sinatra in a Domain Driven Design context. It is still very much a playground, so take that into consideration.

## Domain Driven Application Structure 

This structure builds upon basic concepts of model-view-controller designs, but with a few key layer abstractions and clearer separation of concerns where I felt they were needed. It's broken into three primary design areas:

### Domain

The contains application behavior only. It does not deal with persistence, and it does not deal with controllers or views. Instead, we use two different varieties of models.

* Entities - these are the typical single objects which represent the noun components of your app (ie. People, Places, Things, Books, Cars, etc.)

* Services - these are objects which deal with processing which may or may not utilize entity objects (ie. Registration, FundsTransfer, SocialNetworkShare, etc.)

### Implementation

This is where routing and view behavior goes. We use Rack to mount -- usually based on root uri pattern -- various apps (ie. Implementation::Web, Implementation::Admin, Implementation::Mobile, Implementation::API::V1, etc.) each of which implement the Domain for their own purposes.

Inside the Implementation directory resides a sub-directory each app with, at minimum, an {appname}_implementation.rb file which in most cases is an instance of a Sinatra::Base application (but it could just as easily be a nested Rails app).

Many applications may need little more than this file with a single GET request method to an index -- for instance, in the case where you may be loading a JavaScript framework like ExtJS, SenchaTouch, Backbone.js, etc. The index would simply load the JavaScript application, which would take over from that point forward.

In other cases, you may be developing an interface that is heavy on features -- for instance, a public JSON API (likely what you'd be using in your JavaScript framework to access Domain data anyway, and likewise in a web app which heavily leverages jQuery). In this case, we break out into several Sinatra::Base files based on the features they satisfy. These go into the app's "/routes" sub-directory.

In the case of an API, we don't need view templates or logic. Instead, we use ROAR representers (which provides nice input and output parsing, as well as, HAL compatibility). But, you could optionally use RABL, Grape or the API helper library of choice. Or you could simply have Sinatra spit out .to_json formatted data. The choice is yours.

For typical web views, however, we need to deal with view logic and templating. You could do this with erb, or better yet, HAML. But this exposes another problem often found in many MVC systems... no separation between templating and view logic. To solve this, we use Mustache. We have the following two sub-directories:

  ./implementation/myapp/templates/
  ./implementation/myapp/views/

Templates hold our Mustache templates and partials, which are just standard HTML5 with {{}} around variables which are inserted without knowledge of the underpinnings of the Domain.

Views hold actual classes of view logic. These are how you control what goes into your templates. They contain any formatting of raw data for display, logic which determines what a user sees and anything else which is strictly an aspect of the view. The huge side benefit of this approach is view logic becomes very easy to test with Rspec, whereas it would have been very difficult in an ERB situation.

### Persistence

Database stuff only. This supplies various database abstraction tactics through a consistent API on which the Domain layer can rely. It allows you to swap between database and abstraction tools as needed without creating painful changes within the Domain. Instead of classes which directly represent models, these instead represent the needs of the database in question.

For instance, let's assume the Domain has a concept of a Player. The persistence layer could store player data across several tables as makes sense from the standpoint of normalization, optimization, composite keys, etc. So long as the Domain has only one point of access on the persistence layer per entity, the business of the database is abstracted from the domain. This separation make it easier to change DB selection at any point in the development process without affecting the behavior of your application.

To distinguish the Persistence layer classes from the Domain, we name them like so:

Domain Class - Player.rb  
Data Class - PlayerData.rb  

## Test-Driven Domain Design

One of the biggest gains resulting from these various layers of separation is their independence from any framework. This means we can write spec tests for each layer, and being plain Ruby, those test run incredibly fast. This is critical to insure the test-first process does not become a burden as the codebase grows. 

You can write cucumber acceptance tests to check behavior of the full stack, but I generally recommend doing acceptance testing on an API server, as it covers the most critical and central point of your family of applications. This also gives you the best perspective as an outsider into your Domain, how its entities and services should be named and how each API endpoint should behave. 

Focusing acceptance testing on the API also forces you to write cucumber features which are not brittle, since you are only testing JSON data. The opposite is often true of features running against the DOM by checking against template elements, or worse, text which is returned by a template. You never want a trivial change to a layout to break a test when the behavior you intend to test still works properly. Test upkeep quickly becomes annoying and unwieldy (therefore, you are less likely to do it).


### The Test-Driven Process

While there are no hard and fast rules with regard to the testing process, generally, this is order I suggest:

1. Write a simple cucumber feature for an API endpoint with scenarios for the various expectations you have for that endpoint's behavior. Include the specific format of JSON data both incoming and outgoing from the API (see included examples in the '/features' directory). For now, this process is acting as your specification for the endpoint and, just as important, the process forces you to think about how an external application, including your user interface(s) will expect to deal with the API. We aren't going to bother running this test or working on the step definitions needed to make this feature run just yet. That will come later.

2. More to come...