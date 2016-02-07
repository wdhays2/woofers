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
    @drivers = Driver # start using the Driver activerecord model
    if params[:manufacturer_id].present?
      @drivers = @drivers.where(manufacturer_id: params[:manufacturer_id])
    end

    if params[:sealed_f3].present?
      @drivers = @drivers.where(sealed_f3: params[:sealed_f3])
    end

    if params[:sealed_volume].present?
      @drivers = @drivers.where(sealed_volume: params[:sealed_volume])
    end

    if params[:rms_power].present?
      @drivers = @drivers.where(rms_power: params[:rms_power])
    end

    if params[:x_max].present?
      @drivers = @drivers.where(x_max: params[:x_max])
    end

    # if params[:ranges].present?
    #   ranges = params[:ranges].split('-') # 100-200
    #   driver = driver.where('power_range BETWEEN ? AND ?', ranges[0], ranges[1])
    # end

    page = (params[:start].to_i / params[:length].to_i) + 1
    @drivers = @drivers.where(driver_search)
    @drivers = @drivers.order(order_list)
    @drivers = @drivers.paginate(page: page, per_page: params[:length])
  end

  private

  def order_list
    column = case params['order']['0']['column']
    when '0' then 'model_no'
    when '1' then 'sealed_f3'
    when '2' then 'sealed_volume'
    when '3' then 'high_frequency_limit'
    when '4' then 'rms_power'
    when '5' then 'x_max'
    else 'model_no'
    end

    dir = params['order']['0']['dir'] == 'asc' ? 'asc' : 'desc'
    [column, dir].join(' ')
  end

  def driver_search
    searched_phrase = params['search']['value'].strip
    return '' if searched_phrase.blank?
    ['LOWER(model_no) LIKE ?', "#{searched_phrase.downcase}%"]
  end
end
