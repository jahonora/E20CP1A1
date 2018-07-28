class PagesController < ApplicationController
  authorize_resource :class => false
  def dashboard
  	@users = User.all
  end

  def destroy_user
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to pages_dashboard_path, notice: 'El usuario ha sido borrado'
  end
  def make_admin
  	@user = User.find(params[:id])
  	@user.admin!
  	redirect_to pages_dashboard_path, notice: 'El usuario ha sido asignado como administrador'
  end
  def kick_admin
  	@user = User.find(params[:id])
  	@user.visita!
  	redirect_to pages_dashboard_path, notice: 'El usuario ha sido asignado como visita'
  end
end
