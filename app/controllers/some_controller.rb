class SomeController < ApplicationController
  
   
		def noti
			redirect_to new_user_session_path, notice: "Please Log In or Register to contiune shoping!"
  end
		
  end 
