require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Categories Controller", "index action" do
  before(:each) do
    @controller = Categories.build(fake_request)
    @controller.dispatch('index')
  end
end