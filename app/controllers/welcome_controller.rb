class WelcomeController < ApplicationController
  def index


  end

  def import
    file = params[:file]
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: :xls)

    header = spreadsheet.sheet(0).row(1)
    puts "========================================"

    #puts spreadsheet.last_row
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.sheet(0).row(i)].transpose]
      puts row
      #   puts spreadsheet.sheet(0).row(i)
    end
    #  2..spreadsheet.last_row do |i|
    #     puts spreadsheet.sheet(0).row(i)
    #  end
    #   puts spreadsheet.sheet(0).row(2)
    #   puts file.path

    puts "========================================"
    # spreadsheet = Excel.new(params[:file].path)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i
    #   puts spreadsheet.row(i)
    # end
    redirect_to review_path
  end

  def review

  end
end
