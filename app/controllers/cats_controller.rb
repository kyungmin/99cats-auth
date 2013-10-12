class CatsController < ApplicationController
  before_filter :require_owner, only: [:edit, :update]
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(params[:cat])
    @cat.user_id = current_user.id

    # @cat = current_user.cats.build(params[:cat])

    if @cat.save
      render :show
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes!(params[:cat])
      render :show
    else
      render :edit
    end
  end

  private

  def require_owner
    @cat = Cat.find(params[:id])
    unless @cat.user_id == current_user.id
      flash[:error] = ["You must be the owner of the cat."]
      redirect_to cat_url(@cat)
    end
  end
end
