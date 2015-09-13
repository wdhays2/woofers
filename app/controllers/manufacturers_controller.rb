class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order('name ASC')
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
