module UsersHelper
    
    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
        @user = User.find_by_id(session[:user_id]) if logged_in?
    end
    
    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    def admin?
        current_user.try(:admin?)
    end
    
end
