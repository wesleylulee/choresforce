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
    @offer = Offer.new
    @past_offer = Offer.find(:all, :conditions=>['user_id = ? and listing_id = ?', current_user.id, @listing.id]).first

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
    puts @results.to_s     
      #if session[:id]!=nil
	 #flash[:warning] = 'You are already logged in as <a href = "%s/%s">%s</a>. Log-in as a different user?' % [users_url, session[:id], session[:username]]
      #end
      #@user.login = params[:login] #usernme
  end

  def process_search
      @results = nil
      if params[:category]=='All'
	if params[:title]["title"].empty?
	  @results = Listing.find(:all)
	else
	  @results = Listing.find_with_index(params[:title]["title"])
        end
      else
	if params[:title]["title"].empty?
	  @results = Listing.find(:all, :conditions=>['category=?', params[:category]])
        else
	  @results = Listing.find_with_index(params[:title]["title"], {:conditions=>['category=?', params[:category]]})
        end
      end

      if @results.length ==0
	flash[:notice] = "Sorry, your search didn't render any results. Please try again."
      end
      render 'search', :locals => {:results => @results}
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])
    @listing.user_id = current_user.id

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

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

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
