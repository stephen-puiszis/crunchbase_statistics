class CompaniesController < ApplicationController
  layout 'charts_layout', only: [:show]
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.limit(100)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    # @investments= CompanInvestment.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json

end
