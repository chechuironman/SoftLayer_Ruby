def virtual_charges(user,api)

	### INPUT: SL user, user API key
	### OUTPUT: VirtualGuest array

	begin
	    @account_service = SoftLayer::Service.new("SoftLayer_Account",:username => user,:api_key => api) 
	    @object_mask = 'mask[
							id,
							fullyQualifiedDomainName,
							primaryIpAddress,
							primaryBackendIpAddress,
							powerState[
										name
										],
							datacenter,	
							operatingSystem[
											softwareLicense[
															softwareDescription[
																				longDescription
																				]
															]
											],
							hourlyBillingFlag,
							billingItem[
										orderItem[
													order[
															userRecord[
																		username
																		]
															]
												],
										currentHourlyCharge,
										hourlyRecurringFee,
										hoursUsed,recurringFee
										]
							]'
	        
	        
	    
	    @list = @account_service.object_mask(@object_mask).getVirtualGuests()
	   
	@result = {"success"=> @status,"message"=>@message,"data"=>@list}
    rescue Exception => exception
		   	puts "An error occured  Message: #{exception}"
		   	return @result = ["success"=> false,"message"=>exception]
	end
	
   return @result
end
