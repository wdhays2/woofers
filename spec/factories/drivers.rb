FactoryGirl.define do
  factory :driver do
    manufacturer_id 0
    size 8
    cut_out 7
    model_no '299-000'
    link 'www.parts-express.com'
    ohms 3.2
    rms_power 200
    sensitivity 88
    x_max 0.5
    fs 30
    vas 3
    qts 0.47
    low_frequency_limit 35
    high_frequency_limit 500
    sealed_volume 2.5
    sealed_f3 35
    vented_volume 5
    vented_f3 27
  end
end
