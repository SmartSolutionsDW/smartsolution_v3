class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

   def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user) 
        if @user.persisted?
          sign_in_and_redirect @user,  event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
          
           @auth = request.env["omniauth.auth"]
           session[:omniauth] = @auth.except('extra')
           session[:cliente] = @user.except('cliente')
          logger.debug "<<<<<provides_callback_for 1111>>>>> "
        else
          logger.debug "<<<<<provides_callback_for 222222>>>>>"
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          
          @auth = request.env["omniauth.auth"]
          prueba=@auth.except('extra')
          session[:omniauth] = @auth.except('extra')
          logger.debug "<<<<<provides_callback_for >>>>> #{@auth}"
          session[:cliente] = @user.except('cliente')
          
          redirect_to new_user_registration_url
        end
      end
    }
  end

  #preguntamos si es twiter o facebook
  [:twitter, :facebook].each do |provider|
    provides_callback_for provider
  end

  def failure
      redirect_to root_path
  end

end