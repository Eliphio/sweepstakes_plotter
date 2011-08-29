class BaseController < ApplicationController
  inherit_resources
  respond_to :js

  def create
    create!{ collection_path }
  end

  def update
    update!{ collection_path }
  end
end