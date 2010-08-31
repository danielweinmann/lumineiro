class AuthenticController < ApplicationController

  before_filter :require_user

end

