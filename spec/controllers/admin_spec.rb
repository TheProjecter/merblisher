require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Admins Controller", "index action" do
  before(:each) do
    @controller = Admins.build(fake_request)
    @controller.dispatch('index')
  end
end