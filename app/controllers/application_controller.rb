class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale

  protect_from_forgery with: :exception
  before_action :set_cart, :set_current_user, :set_electee

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    def set_electee
      @electee = Electee.find(session[:electee_id])
    rescue ActiveRecord::RecordNotFound
      @electee = Electee.create
      session[:electee_id] = @electee.id
    end
    def set_current_user
      if session[:user_id].present?
        @current_user=User.find(session[:user_id])
      end
    end
    def require_login
      if !@current_user
        flash[:danger]="Требуется автормзация"
        redirect_to login_path
      end
    end
    def manager_permition
      unless @current_user.try(:moderator?)
        flash[:danger]="Недостаточно прав"
        redirect_to login_path
      end
    end
    def admin_permition
      unless @current_user.try(:administrator?)
        flash[:danger]="Недостаточно прав"
        redirect_to login_path
      end
    end

end
