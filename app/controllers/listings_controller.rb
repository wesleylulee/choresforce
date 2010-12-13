include Geokit
include Geokit::Geocoders

class ListingsController < ApplicationController
  layout 'general'
  before_filter :login_required, :except=>[:index, :show, :search, :process_search]
  # GET /listings
  # GET /listings.xml
  def index
    @listings = Listing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.find(params[:id])
    if @listing.active==false
	flash.now[:warning] = 'This listing is now inactive. Unless the employer choses to use another worker, it will not be activated again.'
    end
    if current_user
    user = current_user
    # Notification
    @messagesToThisListing = Message.find(:all, :conditions=>{:to => current_user.id, :listing_id => @listing.id})	
    @messagesToThisListing.each do |msgt|
	msgt.unread = false
	msgt.save
    end
    # End Add

    @distance = LatLng.new(user.lat,user.lng).distance_to(LatLng.new(@listing.lat,@listing.lng))
    if current_user.id!=@listing.user.id
	@offer = Offer.new
	@past_offer = Offer.find(:first, :conditions=>['user_id = ? and listing_id = ?', current_user.id, @listing.id])
	# Notification Add
	if @past_offer != nil
		@past_offer.listingChanged = false
		@past_offer.save
	end
	# End Add
	if @past_offer!=nil and @past_offer.accepted==true
		flash.now[:notice] = 'Congratulations! Your offer to work for $' + @past_offer.amount.to_s + ' has been accepted. Check your messages below to recieve further information from the employer'
		@place = {:lat=>@listing.lat, :lng=>@listing.lng}
	end
	@new_message = Message.new
	@messages = Message.find(:all, :conditions=>{:from=>[current_user.id, @listing.user.id], :to=>[@listing.user.id, current_user.id], :listing_id=>@listing.id}, :order=>"created_at")
    elsif current_user.id==@listing.user.id
	# Notification Add
	@listing.newOffer = false
	@listing.save
	
	# End Add

	@offers = Offer.find(:all, :conditions=>{:listing_id => @listing.id})
	@new_message = Message.new
	@messageblocks = {}
	@offers.each do |offer|
		@messageblocks[offer.id] = Message.find(:all, :conditions=>{:from=>[current_user.id, offer.user.id ], :to=>[current_user.id, offer.user.id], :listing_id=>@listing.id}, :order=>"created_at")
	end
    end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @past_offers }
    end
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
    if current_user.id != @listing.user.id #if you're not the employer
	flash[:error] = "Access Denied. You are only authorised to edit listings that <i>you</i> have posted."
	redirect_to @listing
    end
  end

  def search  #search results
    @results = params[:results] 
    #puts @results.to_s     
      #if session[:id]!=nil
	 #flash[:warning] = 'You are already logged in as <a href = "%s/%s">%s</a>. Log-in as a different user?' % [users_url, session[:id], session[:username]]
      #end
      #@user.login = params[:login] #usernme
  end

  def process_search
      @results = nil
      @dresults = []
      if params[:cats].nil?; params[:cats] = ['All']; end
      if params[:cats].include?('All')
	if params[:title]["title"].empty?; @results = Listing.find(:all, :conditions=>{:active=>true})
	else; @results = Listing.find_with_index(params[:title]["title"], {:conditions=>{:active=>true}})
        end
      else
	if params[:title]["title"].empty?; @results = Listing.find(:all, :conditions=>{:category=>params[:cats], :active=>true})
        else; @results = Listing.find_with_index(params[:title]["title"], {:conditions=>{:category=>params[:cats], :active=>true}})
        end
      end
      if current_user; @user = current_user
      else; geoc = IpGeocoder.geocode(request.remote_ip); @user = User.new(:lat=>geoc.lat, :lng=>geoc.lng)
      end
      @results.each do |result|
        @dresults.push({"listing"=>result, "distance"=>LatLng.new(@user.lat,@user.lng).distance_to(LatLng.new(result.lat,result.lng))})
      end      
      if !@user.lat.nil? && !@user.lng.nil?
      	@dresults.sort! {|a,b| a["distance"]<=>b["distance"]}
      	@dresults = @dresults.select {|result| result["distance"]<=params[:radius]["radius"].to_f}
      end
      if params[:numResults]["numResults"].to_i==0; params[:numResults]["numResults"]=50; end
      @dresults = @dresults[0,params[:numResults]["numResults"].to_i]
      if @results.length ==0
	flash.now[:warning] = "Sorry, your search didn't render any results. Please try again."
      elsif @user.lat.nil? or @user.lng.nil?
	flash.now[:warning] = "Sorry, Since you are not logged in, and your IP-address was unresolved, the results below aren't necessarily close to your location."
      end
      render 'search', :locals => {:dresults => @dresults, :user => @user}
  end

  def add_erating
	params["rating"] = params["rating"] or 0
	@listing = Listing.find(params['listing_id'])
	employer = @listing.user
	if @listing.employer_rating!=nil
		employer.employer_rating = ((employer.employer_rating*employer.num_eratings)-@listing.employer_rating)/(employer.num_eratings-1)
		employer.num_eratings = (employer.num_eratings-1)
		if employer.num_eratings==0; employer.employer_rating=0; end
	end
	@listing.employer_rating = params["rating"]
	if @listing.save
		employer.employer_rating = ((employer.employer_rating*employer.num_eratings)+@listing.employer_rating)/(employer.num_eratings+1)
		employer.num_eratings = (employer.num_eratings+1)
		employer.save
	end
	redirect_to @listing
  end
  def add_wrating
	params["rating"] = params["rating"] or 0
	@listing = Listing.find(params['listing_id'])
	worker = User.find(params['worker_id'])
	if @listing.worker_rating!=nil
		worker.worker_rating = ((worker.worker_rating*worker.num_wratings)-@listing.worker_rating)/(worker.num_wratings-1)
		worker.num_wratings = (worker.num_wratings-1)
		if worker.num_wratings==0; worker.worker_rating=0; end
	end
	@listing.worker_rating = params["rating"]
	if @listing.save
		worker.worker_rating = ((worker.worker_rating*worker.num_wratings)+@listing.worker_rating)/(worker.num_wratings+1)
		worker.num_wratings = (worker.num_wratings+1)
		worker.save
	end
	redirect_to @listing
  end
  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])
    @listing.user_id = current_user.id
    geocode = GoogleGeocoder.geocode(@listing.address)
    @listing.lat = geocode.lat
    @listing.lng = geocode.lng

    respond_to do |format|
      if @listing.save
        format.html { redirect_to(@listing, :notice => 'Listing was successfully created.') }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def acceptOffer
	@listing = Listing.find(params[:listing_id])
	# Notification flag
	@offers = Offer.find(:all, :conditions=>{:listing_id => @listing.id})
	@offers.each do |offer|
		offer.listingChanged = true
		offer.save
	end
	# End Add
	@offer = Offer.find(params[:offer_id])
	@offer.accepted = true
	if not @offer.save
	  flash.now[:error] = 'Error: The offer you selected could not be accepted.'
	  redirect_to(@listing)
	end
	@listing.active = false
	if not @listing.save
	  flash.now[:error] = 'Error: The offer you selected was accepted, but the listing was not deactivated. Please contact an administrator immediately.'
	  redirect_to(@listing)
	end
	
	redirect_to(@listing, :notice => 'You have sucessfully accepted a work offer. You can continue to message the worker to provide him further details as you wish.')
  end

  def rescindOffer
	@listing = Listing.find(params[:listing_id])
	@offer = Offer.find(params[:offer_id])
	@offer.accepted = false
	# Notification flag
	@offers = Offer.find(:all, :conditions=>{:listing_id => @listing.id})
	@offers.each do |offer|
		offer.listingChanged = true
		offer.save
	end
	# End Add
	if not @offer.save
	  flash.now[:error] = 'Error: The offer could not be rescinded.'
	  redirect_to(@listing)
	end
	@listing.active = true
	if not @listing.save
	  flash.now[:error] = 'Error: The offer was rescinded, but the listing unable to be reactivated. Please contact an administrator immediately.'
	  redirect_to(@listing)
	end
	redirect_to(@listing, :notice => 'Your listing has now been reactivated. You can choose from one of the other offers, or wait for new offers.')
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

	geocode = GoogleGeocoder.geocode(params[:listing][:address])
	@listing.lat = geocode.lat
	@listing.lng = geocode.lng
	
    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to(@listing, :notice => 'Listing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end
