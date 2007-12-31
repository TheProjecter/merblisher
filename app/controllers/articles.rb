class Articles < Application
  provides :xml, :js, :yaml
  # all actions except index and show must require authentication
  before :basic_authentication, :exclude => [:index, :show]
  
  def index
    unless session[:categories]
       # as this is the first execute action, let's load the menu here
        session[:categories] = Category.find(:all).collect(&:name)
    end
    # select requested category
    category = Category.find(:first, :conditions => ["name = ?", params[:category] || 'home'], :include => :articles) 
    # fetch articles for this category
    @articles = Article.find(:all, :conditions => ["category_id = ?", category.id])
    # now we can call render
    render @articles
  end
  
  def show
    @article = Article.find(params[:id])
    render @article
  end
  
  def new
    only_provides :html
    @article = Article.new(params[:article])
    render
  end
  
  def create
    @article = Article.new(params[:article])
    @article.category_id = params[:category][:id]
    if @article.save
      redirect url(:action => "index")
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @article = Article.find(params[:id], :include => :category)
    @category = @article.category
    render
  end
  
  def update
    @article = Article.find(params[:id])
    @article.category_id = params[:category][:id]
    if @article.update_attributes(params[:article])
      redirect url(:action => "index")
    else
      raise BadRequest
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect url(:action => "index")
    else
      raise BadRequest
    end
  end
  
end