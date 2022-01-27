class ApplicationController < ActionController::Base
  #ログイン認証が成功していないと、top,aboutしかアクセスできないようにする
  before_action :authenticate_user!, except:[:top, :about]
  # 指定したデータを保存できるように許可を与える
  before_action :configure_permitted_paramenters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    books_path
  end


  protected

  def configure_permitted_paramenters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
