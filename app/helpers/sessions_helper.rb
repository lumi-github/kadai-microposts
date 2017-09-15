module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #logged_in?値じゃなくてtrueかfalseを返したい
  #!!nil以外はture
  #!!nilはfalse
  def logged_in?
    !!current_user
  end
  
end
