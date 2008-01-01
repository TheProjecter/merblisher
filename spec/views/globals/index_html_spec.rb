require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/globals" do
  before(:each) do
    @controller,@action = get("/globals")
    @body = @controller.body
  end

  it "should mention Globals" do
    @body.should match(/Globals/)
  end
end