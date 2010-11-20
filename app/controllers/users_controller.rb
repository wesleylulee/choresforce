class UsersController < ApplicationController
  layout 'general' 
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  before_filter :login_required, :except=>[:new, :create]
  

  # render new.rhtml
  def new
    @user = User.new({:employer_rating => 0, :num_eratings => 0, :worker_rating => 0, :num_wratings => 0})
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])

    success = @user && @user.save

    if success && @user.errors.empty?
      
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up! You are now logged in!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an administrator."
      render :action => 'new'
    end
  end

  def show #profile
	@user = User.find(params[:id])	
  end

  def account
	@user = current_user
  end
  def destroy
    @user = current_user
    logout_killing_session!
    @user.destroy
    flash[:notice] = "Your account has been deleted."
    redirect_to root_url
  end

  def edit
      @user = current_user
  end
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(account_path, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
