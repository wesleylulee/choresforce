class OffersController < ApplicationController
  layout 'general'
  before_filter :login_required
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
       	# Notification flag
	@listing = @offer.listing
	@listing.newOffer = true
	if @listing.save
		redirect_to(@offer.listing, :notice => 'Offer successfully submitted.')
	end
	# End Add
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
	# Notification flag
	@listing = @offer.listing
	@listing.newOffer = true
	# End Add
    	redirect_to(@offer.listing, :notice => 'Offer was successfully updated.')   
    else
	flash[:error] = "'%s' is an invalid amount. Please enter an integer or deicmal." % params[:offer][:amount]
	redirect_to :controller=>"listings", :action=>"show", :id=>@offer.listing.id
   	#redirect_to :back
        #render :xml => @offer.errors, :status => :unprocessable_entity
    end
  end

end
