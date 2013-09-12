class LegalRequestsController < ApplicationController
load_and_authorize_resource
# before_filter :authenticate_patient!, except: [:index, :show]
before_filter :find_legal_request, only: [:show, :edit, :update, :destroy]

  def index
    @legal_requests = Legal_request.all
  end

  def new
    @legal_request = Legal_request.new
  end

  def create
    @legal_request = Legal_request.new(params[:legal_request])
    if @legal_request.save
      flash[:notice] = "Legal request auction has been initiated."
      redirect_to @legal_request
    else
      flash[:alert] = "Legal request auction has not been initiated."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @legal_request.update_attributes(params[:legal_request])
      flash[:notice] = "Legal request has been updated."
      redirect_to @legal_request
    else
      flash[:alert] = "Legal request has not been initiated."
      render action: "edit"
    end
  end

  def destroy
    @legal_request.destroy
    flash[:notice] = "Legal request has been deleted."
    redirect_to legal_requests_path
  end

private
  def find_legal_request
    @legal_request = Legal_request.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The legal request you were looking for" +
                    " could not be found."
    redirect_to legal_requests_path
  end
end
