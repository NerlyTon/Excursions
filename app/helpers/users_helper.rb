module UsersHelper

    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
        @user = User.find_by_id(session[:user_id]) if logged_in?
    end
    
    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end

    def business?
        current_user.try(:business?) == true
    end

    def redirect_if_not_business
        redirect_to root_path if current_user.try(:business?) == false
    end

    def redirect_if_not_current_user_or_logged_in
        redirect_to root_path if !current_user && !logged_in?
    end

end
