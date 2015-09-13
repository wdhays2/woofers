require 'rails_helper'

RSpec.describe ManufacturersController, type: :controller do
  context 'GET index' do
    before do
      FactoryGirl.create_list(:manufacturer, 4)
    end

    it 'should return a list of manufacturers' do
      get :index
      expect(assigns[:manufacturers].size).to eq(4)
    end
  end

  context 'GET show' do
    before do
      @manufacturer = FactoryGirl.create(:manufacturer)
      FactoryGirl.create_list(:driver, 4, manufacturer_id: @manufacturer.id)
    end

    it 'should return a manufacturer with four drivers' do
      get :show, {id: @manufacturer.id}
      expect(assigns[:manufacturer].drivers.size).to eq(4)
    end
  end
end
