class AccountController < ApplicationController
   model   :user
   
   def index
   redirect_to '/account/login'
   end

   def login
    case request.method
      when :post
        if session['user'] = User.authenticate(params['user_login'], @params['user_password'])
          #AppMailer.deliver_alert("Login: #{@session['user']['name']}","#{@session['user']['name']} just logged on PTM")
          flash['notice']  = "Login successful"
          redirect_back_or_default :controller => "myvita"
        else
          @login    = params['user_login']
          @message  = "Login unsuccessful"
      end
    end
   end

   def signup
    case request.method
      when :post
        @user = User.new(params['user'])
        
        if @user.save      
          session['user'] = User.authenticate(@user.login, params['user']['pwd'])
          #AppMailer.deliver_alert("Signup: #{@session['user']['name']}","#{@session['user']['name']} just sign up on PTM")
          flash['notice']  = "Signup successful"
          redirect_back_or_default :controller => "myvita"          
        end
      when :get
        @user = User.new
    end      
   end  

   def delete
    if params['id']
      @user = User.find(params['id'])
      @user.destroy
    end
    redirect_back_or_default :controller => "myvita"
   end  
    
   def logout
    session['user'] = nil
   end
    
   def welcome
   end

end
