class BidsController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]
before_filter :find_auction
before_filter :find_bid, only: [:show, :edit, :update, :destroy]

  def new
    @bid = @legal_request.bids.build
  end

  def create
    @bid = @legal_request.bids.build(params[:bid])
    @bid.user = current_user
    if @bid.save
      flash[:notice] = "Bid has been created."
      redirect_to [@legal_request, @bid]
    else
      flash[:alert] = "Bid has not been created."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bid.update_attributes(params[:bid])
      flash[:notice] = "Bid has been updated."
      redirect_to [@legal_request, @bid]
    else
      flash[:alert] = "Bid has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @bid.destroy
    flash[:notice] = "Bid has been deleted."
    redirect_to @legal_request
  end

private
  def find_legal_request
    @legal_request = Legal_request.find(params[:legal_request_id])
  end

  def find_bid
    @bid = @legal_request.bids.find(params[:id])
  end
end

