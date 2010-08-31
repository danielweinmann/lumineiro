class NumbersController < AuthenticController

  inherit_resources

  actions :all, :except => [ :show ]

  before_filter :paginate, :only => [:index]

  def create
    create! { numbers_url }
  end

  def update
    update! { numbers_url }
  end

  private

  def paginate
    session[:numbers_search] = params[:search] if params[:search]
    @search = Number.search(session[:numbers_search])
    @numbers = @search.paginate :page => params[:page], :order => 'updated_at DESC'
  end

end

