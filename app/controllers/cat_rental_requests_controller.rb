class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(params[:cat_rental_request])
    if @cat_rental_request.save
      redirect_to cat_cat_rental_request_url(@cat_rental_request.cat_id, @cat_rental_request.id)
    else
      render :new
    end

  end
  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_requests =  CatRentalRequest.where({:cat_id => @cat_rental_request.cat_id}).sort_by! do |request|
                              request.start_date
                            end

    render :show
  end

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    @cat_rental_requests =  CatRentalRequest.where({:cat_id => @cat_rental_request.cat_id}).sort_by! do |request|
                              request.start_date
                            end

#    redirect_to cat_cat_rental_request_url(@cat_rental_request)
    render :show
  end

  def deny
    @cat_rental_requests =  CatRentalRequest.all.sort_by! do |request|
                              request.start_date
                            end
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_cat_rental_request_url(@cat_rental_request)
  end
end



