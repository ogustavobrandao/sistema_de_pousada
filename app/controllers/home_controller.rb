class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    case current_user.role
    when 'administrador'
      render 'admins/index'
    when 'funcionario'
      render 'funcionarios/home'
    else
      redirect_to unauthenticated_root_path
    end
  end
end