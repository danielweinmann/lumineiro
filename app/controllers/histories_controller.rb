class HistoriesController < AuthenticController

  inherit_resources

  actions :all, :except => [ :show ]

  before_filter :paginate, :only => [:index]

  def create
    create! { histories_url }
  end

  def update
    update! { histories_url }
  end

  private

  def paginate
    session[:histories_search] = params[:search] if params[:search]
    @search = History.search(session[:histories_search])
    @histories = @search.paginate :page => params[:page], :order => 'updated_at DESC'
  end

end

