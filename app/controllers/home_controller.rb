# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def generate
    kit = WeasyPrint.new('http://localhost:3000/')
    respond_to do |format|
      format.pdf do
        send_data(kit.to_pdf, filename: 'generated.pdf', type: 'application/pdf')
      end
    end
  end
end
