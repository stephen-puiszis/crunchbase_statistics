class LocationsController < ApplicationController
  layout 'charts_layout' , only: [:index, :show]
  # GET /locations
  # GET /locations.json


  def index
     if params[:search].present?
        if @locations = Location.near(params[:search], params[:radius], :order => :distance).any?
          @locations = Location.near(params[:search], params[:radius], :order => :distance)
        else
          @locations = Location.near('Chicago', 100, :order => :distance)
        end
    else
      @locations = Location.near('Chicago', 100, :order => :distance)
    end
    @fundings = Funding.ltm_fundings(365)
    @fundings_q1 = Funding.quarterly_fundings(Time.now().year, 'q1').for_city(params[:search])
    @fundings_q2 = Funding.quarterly_fundings(Time.now().year, 'q2').for_city(params[:search])
    @fundings_q3 = Funding.quarterly_fundings(Time.now().year-1, 'q3').for_city(params[:search])
    @fundings_q4 = Funding.quarterly_fundings(Time.now().year-1, 'q4').for_city(params[:search])
    @seed_funding = @fundings.for_funding_round('seed').for_city(params[:search])
    @angel_funding = @fundings.for_funding_round('angel').for_city(params[:search])
    @a_funding = @fundings.for_funding_round('a').for_city(params[:search])
    @b_funding = @fundings.for_funding_round('b').for_city(params[:search])
    @c_funding = @fundings.for_funding_round('c').for_city(params[:search])
    @d_funding = @fundings.for_funding_round('d').for_city(params[:search])
    @e_funding = @fundings.for_funding_round('e').for_city(params[:search])
    @f_funding = @fundings.for_funding_round('f').for_city(params[:search])
    @g_funding = @fundings.for_funding_round('g').for_city(params[:search])
    @venture_funding = @fundings.for_funding_round('venture_round').for_city(params[:search])
    @private_equity_funding = @fundings.for_funding_round('private_equity').for_city(params[:search])
    @debt_funding = @fundings.for_funding_round('debt_round').for_city(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
