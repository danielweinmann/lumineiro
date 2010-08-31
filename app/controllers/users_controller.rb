class UsersController < AuthenticController

  inherit_resources

  actions :all, :except => [ :show ]

  before_filter :paginate, :only => [:index]

  def create
    create! { users_url }
  end

  def update
    update! { users_url }
  end

  private

  def paginate
    session[:users_search] = params[:search] if params[:search]
    @search = User.search(session[:users_search])
    @users = @search.paginate :page => params[:page], :order => 'name'
  end

end

