require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/categories" do
  before(:each) do
    @controller,@action = get("/categories")
    @body = @controller.body
  end

  it "should mention Categories" do
    @body.should match(/Categories/)
  end
end