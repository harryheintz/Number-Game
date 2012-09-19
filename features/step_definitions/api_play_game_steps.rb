World(Rack::Test::Methods)

When /^I send a GET request to "([^\"]*)"$/ do |path|
  page.driver.get path
end

When /^I send a POST request to "([^\"]*)" with the following:$/ do |path, body|
  page.driver.post path, body
end

When /^I send a PUT request to "([^\"]*)" with the following:$/ do |path, body|
  page.driver.put path, body
end

When /^I send a DELETE request to "([^\"]*)"$/ do |path|
  page.driver.delete path
end

Then /^the response code should be "([^\"]*)"$/ do |status|
  page.driver.status_code.should == status.to_i
end

Then /^the JSON response body should have the following elements:$/ do |elements|
  elements.raw.flatten.map {|element| page.driver.response.body.should include('"'+ element + '":') }
end

Then /^the JSON response should return "([^\"]*)" for "([^\"]*)"$/ do |value, element|
  parsed_response = ActiveSupport::JSON.decode(page.driver.response.body)
  parsed_response["user"][element].should == value
end
