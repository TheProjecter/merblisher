class Articles < Application
  provides :xml, :js, :yaml
  
  def index
    @articles = Article.find(:all)
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
    if @article.save
      redirect '/articles'
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @article = Article.find(params[:id])
    render
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect url(:article, @article)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect '/articles'
    else
      raise BadRequest
    end
  end
  
end