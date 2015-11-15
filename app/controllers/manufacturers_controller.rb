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
    conditions = [[]]
    if params[:manufacturer_id].present?
      conditions[0] << 'manufacturer_id = ?'
      conditions << [:manufacturer_id]
    end

    # if params[:ranges].present?
    #   ranges = params[:ranges].split('-') # 100-200
    #   conditions[0] << 'power_range BETWEEN ? AND ?'
    #   conditions << ranges[0]
    #   conditions << ranges[1]
    # end

    # if params ...

    # end

    conditions[0] = conditions[0].join(' AND ')
    drivers = Driver.where(conditions).limit(params[:length]) # .paginate....
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
