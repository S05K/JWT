##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext
                class IncomingPhoneNumberContext < InstanceContext
                class AssignedAddOnContext < InstanceContext

                     class AssignedAddOnExtensionList < ListResource
                
                    ##
                    # Initialize the AssignedAddOnExtensionList
                    # @param [Version] version Version that contains the resource
                    # @return [AssignedAddOnExtensionList] AssignedAddOnExtensionList
                    def initialize(version, account_sid: nil, resource_sid: nil, assigned_add_on_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid, resource_sid: resource_sid, assigned_add_on_sid: assigned_add_on_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers/#{@solution[:resource_sid]}/AssignedAddOns/#{@solution[:assigned_add_on_sid]}/Extensions.json"
                        
                    end
                
                    ##
                    # Lists AssignedAddOnExtensionInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AssignedAddOnExtensionInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of AssignedAddOnExtensionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AssignedAddOnExtensionInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AssignedAddOnExtensionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AssignedAddOnExtensionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AssignedAddOnExtensionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AssignedAddOnExtensionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.AssignedAddOnExtensionList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class AssignedAddOnExtensionContext < InstanceContext
                    ##
                    # Initialize the AssignedAddOnExtensionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource to fetch.
                    # @param [String] resource_sid The SID of the Phone Number to which the Add-on is assigned.
                    # @param [String] assigned_add_on_sid The SID that uniquely identifies the assigned Add-on installation.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the resource to fetch.
                    # @return [AssignedAddOnExtensionContext] AssignedAddOnExtensionContext
                    def initialize(version, account_sid, resource_sid, assigned_add_on_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, resource_sid: resource_sid, assigned_add_on_sid: assigned_add_on_sid, sid: sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers/#{@solution[:resource_sid]}/AssignedAddOns/#{@solution[:assigned_add_on_sid]}/Extensions/#{@solution[:sid]}.json"

                        
                    end
                    ##
                    # Fetch the AssignedAddOnExtensionInstance
                    # @return [AssignedAddOnExtensionInstance] Fetched AssignedAddOnExtensionInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        AssignedAddOnExtensionInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            resource_sid: @solution[:resource_sid],
                            assigned_add_on_sid: @solution[:assigned_add_on_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.AssignedAddOnExtensionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.AssignedAddOnExtensionContext #{context}>"
                    end
                end

                class AssignedAddOnExtensionPage < Page
                    ##
                    # Initialize the AssignedAddOnExtensionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AssignedAddOnExtensionPage] AssignedAddOnExtensionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AssignedAddOnExtensionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AssignedAddOnExtensionInstance] AssignedAddOnExtensionInstance
                    def get_instance(payload)
                        AssignedAddOnExtensionInstance.new(@version, payload, account_sid: @solution[:account_sid], resource_sid: @solution[:resource_sid], assigned_add_on_sid: @solution[:assigned_add_on_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.AssignedAddOnExtensionPage>'
                    end
                end
                class AssignedAddOnExtensionInstance < InstanceResource
                    ##
                    # Initialize the AssignedAddOnExtensionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AssignedAddOnExtension
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AssignedAddOnExtensionInstance] AssignedAddOnExtensionInstance
                    def initialize(version, payload , account_sid: nil, resource_sid: nil, assigned_add_on_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'resource_sid' => payload['resource_sid'],
                            'assigned_add_on_sid' => payload['assigned_add_on_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'product_name' => payload['product_name'],
                            'unique_name' => payload['unique_name'],
                            'uri' => payload['uri'],
                            'enabled' => payload['enabled'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'resource_sid' => resource_sid  || @properties['resource_sid']  ,'assigned_add_on_sid' => assigned_add_on_sid  || @properties['assigned_add_on_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AssignedAddOnExtensionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AssignedAddOnExtensionContext.new(@version , @params['account_sid'], @params['resource_sid'], @params['assigned_add_on_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify the resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Phone Number to which the Add-on is assigned.
                    def resource_sid
                        @properties['resource_sid']
                    end
                    
                    ##
                    # @return [String] The SID that uniquely identifies the assigned Add-on installation.
                    def assigned_add_on_sid
                        @properties['assigned_add_on_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] A string that you assigned to describe the Product this Extension is used within.
                    def product_name
                        @properties['product_name']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The URI of the resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # @return [Boolean] Whether the Extension will be invoked.
                    def enabled
                        @properties['enabled']
                    end
                    
                    ##
                    # Fetch the AssignedAddOnExtensionInstance
                    # @return [AssignedAddOnExtensionInstance] Fetched AssignedAddOnExtensionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.AssignedAddOnExtensionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.AssignedAddOnExtensionInstance #{values}>"
                    end
                end

             end
             end
             end
            end
        end
    end
end


