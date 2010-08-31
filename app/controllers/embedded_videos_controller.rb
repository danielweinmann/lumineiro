class EmbeddedVideosController < AuthenticController

  inherit_resources

  actions :all, :except => [ :show ]

  before_filter :paginate, :only => [:index]

  def create
    create! { embedded_videos_url }
  end

  def update
    update! { embedded_videos_url }
  end

  private

  def paginate
    session[:embedded_videos_search] = params[:search] if params[:search]
    @search = EmbeddedVideo.search(session[:embedded_videos_search])
    @embedded_videos = @search.paginate :page => params[:page], :order => 'title'
  end

end

