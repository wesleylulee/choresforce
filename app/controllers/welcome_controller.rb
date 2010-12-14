class WelcomeController < ApplicationController
	layout 'general' 
	DisplayListing = Struct.new(:listing, :color, :msgnum, :msg)
	def show
	end
	
	def index 
		if current_user
			@activeReds = Array.new
			@activeGreys = Array.new
			
			# @inactiveGreens = Array.new
			# @inactiveReds = Array.new
			# @inactiveGreys = Array.new
			
			#ACTIVE LISTINGS
			@biglist = Array.new
			@listings = Listing.find(:all, :conditions=>{:user_id => current_user.id, :active => true}) 
			@offers = Offer.find(:all, :conditions=>{:user_id => current_user.id,}) 
			# @offerlistings = Array.new
			# if @offers != nil 
				 # @offers.each do |offer| 
					 # if offer.listing.active == true
						# @offerlistings.push offer.listing
					 # end
				 # end
			# end
			#@biglist = @listings | @offerlistings
			
			
			#@biglist.sort!{ |a, b| b.updated_at <=> a.updated_at}
			
			
			 if @listings != nil 
				 #@listings.sort!{ |a, b| b.updated_at <=> a.updated_at}
				 @listings.each do |listing| 
					
					 toAdd = DisplayListing.new
					 toAdd.listing = listing
					
					 if listing.newOffer == true 
				
						toAdd.msgnum = 0
						toAdd.color = 'green'
						toAdd.msg = '' + listing.offers.size.to_s + ' user(s) have offered to work for you.'
						@biglist.push toAdd
					 else
						@msgs = Message.find(:all, :conditions=>{:to => current_user.id, :listing_id => listing.id, :unread => true}) 
						#<!-- If there are unread messages in the listing, highlight it red as well -->
						#Unread messages in this listing:  @msgs.size
						if @msgs.size > 0 
							toAdd.msgnum = @msgs.size
							toAdd.color = 'green'
							toAdd.msg = '' + listing.offers.size.to_s + ' user(s) have offered to work for you.'
							@biglist.push toAdd
							#@activeReds.push listing
						else
							#@activeGreys.push listing
							toAdd.msgnum = 0
							toAdd.color = 'grey'
							toAdd.msg = '' + listing.offers.size.to_s + ' user(s) have offered to work for you.'
							@biglist.push toAdd
						end
					end
				 end
			 
			 end 
			
			 if @offers != nil 
				 @offers.each do |offer| 
					 if offer.listing.active == true
					 
						toAdd = DisplayListing.new
						toAdd.listing = offer.listing
						
						@msgs = Message.find(:all, :conditions=>{:to => current_user.id, :listing_id => offer.listing.id, :unread => true}) 
						
						if @msgs.size > 0
							# You have = @msgs.size  unread messages
							# @activeReds.push offer.listing
							toAdd.msgnum = @msgs.size
							toAdd.color = 'green'
							toAdd.msg = 'You have new messages.'
							@biglist.push toAdd
							
						else
							#@activeGreys.push offer.listing
							toAdd.msgnum = 0
							toAdd.color = 'grey'
							toAdd.msg = 'You have offered to work for $%i' % offer.amount
							@biglist.push toAdd
						end 
					 end 
				 end 
			 end
			
		@biglist.sort!{ |a, b| b.listing.updated_at <=> a.listing.updated_at}
		#INACTIVE LISTINGS.
		
		
		
		@listings = Listing.find(:all, :conditions=>{:user_id => current_user.id, :active => false})
		@biginactivelist = Array.new
		if @listings != nil
			@listings.each do |ls|
			
				@msgs = Message.find(:all, :conditions=>{:to => current_user.id, :unread => true, :listing_id => ls.id}) 
				
				toAdd = DisplayListing.new
				toAdd.listing = ls
							
				if @msgs.size > 0
					toAdd.color = 'green'
					toAdd.msgnum = @msgs.size
					toAdd.msg = 'You have new messages for this listing.'
					@biginactivelist.push toAdd
				else
					toAdd.color = 'grey'
					toAdd.msgnum = 0
					toAdd.msg = 'You have accepted an offer for this listing.'
					@biginactivelist.push toAdd
				end
			
			end
		end
		
		#<!-- Finding whether to highlight inactive ones is trickier. -->
		#<!-- We have to find out whether it changed since last time. -->
				
		 @offers = Offer.find(:all, :conditions=>{:user_id => current_user.id}) 
			 if @offers != nil 
		
					 @offers.each do |offer| 
						 if offer.listing.active == false 
						
								@msgs = Message.find(:all, :conditions=>{:to => current_user.id, :listing_id => offer.listing.id, :unread => true}) 
							
								toAdd = DisplayListing.new
								toAdd.listing = offer.listing

							#if @msgs.size > 0
								#You have = @msgs.size  unread messages
								#@inactiveReds.push offer.listing
								
							#	toAdd.color = 'green'
							#	toAdd.msgnum = @msgs.size
							#	toAdd.msg = 'You have new messages for this listing.'
							#	@biginactivelist.push toAdd
								
							 #else
								toAdd.msgnum = 0
								if offer.listingChanged == true && offer.accepted == false 
									#@inactiveReds.push offer.listing
									toAdd.color = 'red'
									toAdd.msg = 'Sorry, your offer has been rejected.'
									@biginactivelist.push toAdd
								elsif  offer.listingChanged == true && offer.accepted == true 
									#@inactiveGreens.push offer.listing
									toAdd.color = 'green'
									toAdd.msg = 'Congratulations, your offer has been accepted.'
									toAdd.msgnum = @msgs.size
									@biginactivelist.push toAdd
								elsif offer.accepted == true && @msgs.size > 0
									toAdd.color = 'green'
									toAdd.msg = 'You have new messages.'
									toAdd.msgnum = @msgs.size
									@biginactivelist.push toAdd
								else 
									#@inactiveGreys.push offer.listing
									toAdd.color = 'grey'
										if offer.accepted == false 
											toAdd.msg = 'Sorry, your offer has been rejected.'
										else
											toAdd.msg = 'Your offer has been accepted.'
										end
											
									@biginactivelist.push toAdd
								end
							 #end 
						end 
					 end
			end
		

		@biginactivelist.sort!{ |a, b| b.listing.updated_at <=> a.listing.updated_at}
		
		end
	end

	
end
