class Categories < Application
  provides :xml, :js, :yaml
  
  before :basic_authentication
  after  :update_categories_in_menu, :only => [:create, :update, :destroy]
  
  def index
    @categories = Category.find(:all)
    render @categories
  end
  
  def show
    @category = Category.find(params[:id])
    render @category
  end
  
  def new
    only_provides :html
    @category = Category.new(params[:category])
    render
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect url(:categories)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @category = Category.find(params[:id])
    render
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect url(:categories)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect url(:categories)
    else
      raise BadRequest
    end
  end
  
private
  
  def update_categories_in_menu
    # update the categories in the session, so that 
    # the global menu will be updated. this will not
    # happen to often so there's no need now to optimize :)
    session[:categories] = Category.find(:all).collect(&:name)
  end

end