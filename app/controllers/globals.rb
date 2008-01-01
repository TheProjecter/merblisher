class Globals < Application
  provides :xml, :js, :yaml

  before :basic_authentication
  
  def index
    @globals = Global.find(:all)
    render @globals
  end
  
  def show
    @global = Global.find(params[:id])
    render @global
  end
  
  def new
    only_provides :html
    @global = Global.new(params[:global])
    render
  end
  
  def create
    @global = Global.new(params[:global])
    if @global.save
      redirect url(:action => "index")
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @global = Global.find(params[:id])
    render
  end
  
  def update
    @global = Global.find(params[:id])
    if @global.update_attributes(params[:global])
      redirect url(:action => "index")
    else
      raise BadRequest
    end
  end
  
  def destroy
    @global = Global.find(params[:id])
    if @global.destroy
      redirect url(:globals)
    else
      raise BadRequest
    end
  end
end