class Admin < Application
  
  before :basic_authentication
  
  def index
    render
  end
  
end