class NotebooksController < ApplicationController
  before_action :authenticate
  
  def index
    @user = User.find_by(id: session[:user_id])
    @notebooks = @user.notebooks
  end

  def show
    @notebook = Notebook.find(params[:id])
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user = User.find_by(id: session[:user_id])
    @notebook.color = ['505168', 'b3c0a4', 'eaefd3', 'dcc48e'].sample

    if @notebook.save
      redirect_to @notebook
    else
      render :new
    end
  end

  def edit
    @notebook = Notebook.find(params[:id])
  end

  def update
    @notebook = Notebook.find(params[:id])

    if @notebook.update(notebook_params)
      redirect_to @notebook
    else
      render :edit
    end
  end

  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.destroy

    redirect_to root_path
  end

  private
    def notebook_params
      params.require(:notebook).permit(:title)
    end

    def authenticate
      if session[:user_id] == nil
        redirect_to controller: :users, action: :login
    end
  end
end