require 'csv'
namespace :wdh do

  desc 'Imports data for the specified date'
  task :import_csv_file => :environment do |t, args|
    file_path = Rails.root.to_s + '/data/WooferList.csv'
    raise 'Output file does not exist' unless File.exists?(file_path)


    CSV.foreach(file_path, headers: true).each do |row|
      manufacturer = if Manufacturer.where('name ILIKE ?', row[2]).exists? 
        Manufacturer.where('name ILIKE ?', row[2]).first
      else
        Manufacturer.create({name: row[2]})
      end

      manufacturer.drivers.create(
        size: row[0],
        cut_out: row[1],
        model_no: row[3],
        link: row[4],
        ohms: row[5],
        rms_power: row[6],
        sensitivity: row[7],
        x_max: row[8],
        fs: row[9],
        vas: row[10],
        qts: row[11],
        low_frequency_limit: row[12].split('-')[0],
        high_frequency_limit: row[12].split('-')[1],
        sealed_volume: row[13],
        sealed_f3: row[14],
        vented_volume: row[15],
        vented_f3: row[16]
        )
    end

  end
end
