class UsersController < ApplicationController
  def login
    if request.post?
      @user = User.find_by(username: params[:username], password: params[:password])
      if @user
        session[:user_id] = @user.id
        redirect_to controller: :notebooks, action: :index
      else
        redirect_to controller: :users, action: :login_failed
      end
    end
  end

  def login_failed
  end

  def logout
    session[:user_id] = nil
    redirect_to controller: :users, action: :login
  end

  def show
  end

  def new
    if(params[:username] && params[:password])
      @user = User.new(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect_to controller: :notebooks
    else
      render :new
    end
    # @user = User.new(user_params)

    # if @user.save
    #   redirect_to controller: :notebooks
    # else
    #   render :new
    # end
  end

  def edit
    # @notebook = Notebook.find(params[:id])
  end

  def update
    # @notebook = Notebook.find(params[:id])

    # if @notebook.update(notebook_params)
    #   redirect_to @notebook
    # else
    #   render :edit
    # end
  end

  def destroy
    # @notebook = Notebook.find(params[:id])
    # @notebook.destroy

    # redirect_to root_path
  end
end