class ApplicationController < ActionController::Base
	#Permite configurar los parametros permitido para ser guardados en la base de datos
	# pero solo una vez segun se cumpla que exista el "Devise Controller"
	before_action :configure_permitted_parameters, if: :devise_controller?

	# Primera Acción 
	before_action :authenticate_user!



protected

	def configure_permitted_parameters
	  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
			user_params.permit(:username, :email, :password, :password_confirmation)
		end
	end

end