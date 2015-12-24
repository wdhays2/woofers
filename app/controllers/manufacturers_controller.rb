class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order('name ASC')
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def list
    drivers = Driver # start using the Driver activerecord model
    if params[:manufacturer_id].present?
      drivers = drivers.where(manufacturer_id: params[:manufacturer_id])
    end

    if params[:sealed_f3].present?
      drivers = drivers.where(sealed_f3: params[:sealed_f3])
    end

    if params[:sealed_volumn].present?
      drivers = drivers.where(sealed_volumn: params[:sealed_volumn])
    end

    if params[:rms_power].present?
      drivers = drivers.where(rms_power: params[:rms_power])
    end

    if params[:xmax].present?
      drivers = drivers.where(sealed_f3: params[:xmax])
    end

    # if params[:ranges].present?
    #   ranges = params[:ranges].split('-') # 100-200
    #   driver = driver.where('power_range BETWEEN ? AND ?', ranges[0], ranges[1])
    # end

    page = (params[:start].to_i / params[:length].to_i) + 1
    drivers = drivers.paginate(page: page, per_page: params[:length])
    render json: format_for_data_tables(drivers, 20, 100) # drivers.total_entries from will_paginate
  end

  private

  def format_for_data_tables(drivers, records_filtered, total_records)
    retval = { data: [], recordsFiltered: records_filtered, recordsTotal: total_records }
    drivers.each do |driver|
      retval[:data] << [
        driver.model_no,
        driver.sealed_f3,
        driver.sealed_volume,
        driver.high_frequency_limit,
        driver.rms_power,
        driver.x_max
      ]
    end
    retval
  end
end
