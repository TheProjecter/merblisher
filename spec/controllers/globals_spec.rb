require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Globals Controller", "index action" do
  before(:each) do
    @controller = Globals.build(fake_request)
    @controller.dispatch('index')
  end
end