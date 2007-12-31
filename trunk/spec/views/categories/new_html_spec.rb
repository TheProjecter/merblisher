require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/categories/new" do
  before(:each) do
    @controller,@action = get("/categories/new")
    @body = @controller.body
  end

  it "should mention Categories" do
    @body.should match(/Categories/)
  end
end