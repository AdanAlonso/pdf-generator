# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def generate
    kit = WeasyPrint.new('http://localhost:3000/')
    # NOTE: Some notes about WeasyPrint and CSS for printing in general:
    #   Use @media print to define specific printing rules
    #   To change the size of the generated PDF, use the @page element in CSS, combined with the size attribute (doesn't work in Firefox, but WeasyPrint accepts it regardless)
    #   Use page-break-before, page-break-after and page-break-inside to control page breaks
    #   box_shadow doesn't work
    #   display: fixed; makes the item show in every page
    #   Responsive obeys page size when printing too
    #   Iframes don't work
    #   Title of the generated PDF is the name of the app (at least by default)
    respond_to do |format|
      format.pdf do
        send_data(kit.to_pdf, filename: 'generated.pdf', type: 'application/pdf')
      end
    end
  end
end
