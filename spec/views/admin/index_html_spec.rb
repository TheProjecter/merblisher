require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/admin" do
  before(:each) do
    @controller,@action = get("/admin")
    @body = @controller.body
  end

  it "should mention Admin" do
    @body.should match(/Admin/)
  end
end