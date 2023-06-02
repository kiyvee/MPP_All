require "prawn"
require 'csv'

class ReportDownloadController < ApplicationController
  def export_general_pdf

    pdf = ReportDownloadService.assemble_general_report(Library.all, User.all)

    send_data(pdf.render, filename: 'general(users&libs).pdf', type: 'application/pdf')
  end


  def export_lib_general_csv
    @libraries = Library.all

    respond_to do |format|
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=libs.csv"
        headers['Content-Type'] ||= 'text/csv'
        csv_data = CSV.generate(headers: true) do |csv|
          csv << %w[ID Name Location Year]
          @libraries.each do |library|
            csv << [library.id, library.name, library.location, library.year]
          end
        end
        send_data(csv_data, filename: 'libs.csv')
      end
    end
  end

  def export_lib_pdf
    library = Library.find(params[:id])

    pdf = ReportDownloadService.assemble_report_lib(library)

    send_data(pdf.render, filename: 'lib_individual_report.pdf', type: 'application/pdf')

  end

  def export_user_pdf
    user = User.find(params[:id])

    pdf = ReportDownloadService.assemble_report_user(user)

    send_data(pdf.render, filename: 'users.pdf', type: 'application/pdf')

  end

end