class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    private

    def authenticate_admin!
      unless current_user&.admin?
        redirect_to root_path, alert: "Você não tem permissão para acessar esta página."
      end
    end
  
    def authenticate_funcionario!
      unless current_user&.funcionario?
        redirect_to root_path, alert: "Você não tem permissão para acessar esta página."
      end
    end
end