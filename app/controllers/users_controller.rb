class UsersController < ApplicationController

# signup
  get '/signup' do
    if logged_in?
      redirect '/show'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:user][:email].empty? || params[:user][:name].empty? || params[:user][:password].empty?
      flash[:message] = "Fill out all fields."
      redirect '/signup'
    end
    if User.find_by(email: params[:user][:email])
      flash[:message] = "That email is taken."
      redirect '/signup'
    else
      @user = User.create(params[:user])
      redirect '/login'
    end
  end

# login
  get '/login' do
    if logged_in?
      redirect '/show'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if ready?
        redirect '/show'
      else
        redirect '/edit'
      end
    else
      flash[:message] = "Those are not valid credentials. Try again."
      redirect 'login'
    end
  end

#account page
  get '/show' do
    if logged_in?
      @user = current_user
      erb :'users/show'
    else
      redirect '/login'
    end
  end

  get '/edit' do
    if logged_in?
      @user = current_user
      erb :'/users/edit'
    else
      redirect '/login'
    end
  end

  patch '/show' do
    @user = current_user
    @user.update(params[:user])
    @user.save
    erb :'users/show'
  end

# admin privileges

  get '/users/:id' do
    if logged_in?
      if admin?
        @user = User.find(params[:id])
        erb :'users/inspect'
      else
        redirect '/show'
      end
    else
      redirect 'login'
    end
  end



#logout
  get '/logout' do
    session.clear
    redirect '/'
  end

end
