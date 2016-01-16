#!/usr/bin/env ruby

require 'zip'
require 'nokogiri'
require 'json'

class TrackCompiler
  def initialize(tracks_glob, output_folder)
    @track_files = Dir[File.join(File.dirname(__FILE__), tracks_glob)]
    @output_folder = File.join(File.dirname(__FILE__), output_folder)
  end

  def convert(input_filename, output_filename)
    kml = get_parsed_kml(input_filename)
    output = get_output_data(kml)

    json_output = JSON.generate(output)

     File.open(output_filename, 'w') do |file|
      file.write(json_output + "\n")
    end
  end

  def convert_all()
    @track_files.each do |input_filename|
      output_filename = File.join(@output_folder, File.basename(input_filename, ".*") + ".json")
      self.convert(input_filename, output_filename)
    end
  end

  protected

  def get_parsed_kml(zip_filename)
    Zip::File.open(zip_filename) do |zip_file|
      Nokogiri::HTML(zip_file.glob('doc.kml').first.get_input_stream)
    end
  end

  def get_output_data(kml)
    output = {
      :foo => 'bar'
    }
    puts output

    output
  end
end

track_compiler = TrackCompiler.new("tracks/_export/*.kmz", "tracks")
track_compiler.convert_all()
