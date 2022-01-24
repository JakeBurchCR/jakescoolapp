class PagesController < ApplicationController
  
  def create
    @notebook = Notebook.find(params[:notebook_id])
    @page = @notebook.pages.create(page_params)
    redirect_to notebook_path(@notebook)
  end

  def destroy
    @notebook = Notebook.find(params[:notebook_id])
    @page = @notebook.pages.find(params[:id])
    @page.destroy
    redirect_to notebook_path(@notebook)
  end


  private
    def page_params
      params.require(:page).permit(:title, :body)
    end
end
