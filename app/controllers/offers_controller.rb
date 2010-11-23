class OffersController < ApplicationController
  layout 'general'
  before_filter :login_required
  # GET /offers
  # GET /offers.xml
  def index
    @offers = Offer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.xml
  def show
    @offer = Offer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.xml
  def new
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.xml
  def create
    @offer = Offer.new(params[:offer])

    if @offer.save
        redirect_to(@offer.listing, :notice => 'Offer successfully submitted.')
    else
	flash[:error] = "'%s' is an invalid amount. Please enter an integer or deicmal." % params[:offer][:amount]
	redirect_to :controller=>"listings", :action=>"show", :id=>@offer.listing.id
    end
  end

  # PUT /offers/1
  # PUT /offers/1.xml
  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(params[:offer])
    	redirect_to(@offer.listing, :notice => 'Offer was successfully updated.')   
    else
	flash[:error] = "'%s' is an invalid amount. Please enter an integer or deicmal." % params[:offer][:amount]
	redirect_to :controller=>"listings", :action=>"show", :id=>@offer.listing.id
   	#redirect_to :back
        #render :xml => @offer.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.xml
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to(offers_url) }
      format.xml  { head :ok }
    end
  end
end
