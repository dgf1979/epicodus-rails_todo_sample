class ListsController < ApplicationController
  # (C)reate
  def new # new is a GET that posts to #create on submit
    @list = List.new
    render :new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to  lists_path
    else
      render :new
    end
  end
  # (R)ead
  def index # list all
    @lists = List.all
    render :index
  end
  def show # list one = often linked to from list-all (index)
    @list = List.find(params[:id])
    render :show
  end
  # (U)pdate
  def edit # edit is a GET that posts to #update on submit
    @list = List.find(params[:id])
    render :edit
  end
  def update # updates controller with postdata and (often) redirects to list if successful
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end
  # (D)elete
  def destroy # updates controller with request to destroy record (often) redirects to list
     @list = List.find(params[:id])
     @list.destroy
     redirect_to lists_path
  end

  # non-CRUD - not mapped to RAILS conventions
  private
  def list_params
    params.require(:list).permit(:name, :description)
  end
end
