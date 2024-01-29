##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Trusthub
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Trusthub < TrusthubBase
            class V1 < Version
                class CustomerProfilesList < ListResource
                    ##
                    # Initialize the CustomerProfilesList
                    # @param [Version] version Version that contains the resource
                    # @return [CustomerProfilesList] CustomerProfilesList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/CustomerProfiles"
                        
                    end
                    ##
                    # Create the CustomerProfilesInstance
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] email The email address that will receive updates when the Customer-Profile resource changes status.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [String] status_callback The URL we call to inform your application of status changes.
                    # @return [CustomerProfilesInstance] Created CustomerProfilesInstance
                    def create(
                        friendly_name: nil, 
                        email: nil, 
                        policy_sid: nil, 
                        status_callback: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Email' => email,
                            'PolicySid' => policy_sid,
                            'StatusCallback' => status_callback,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        CustomerProfilesInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists CustomerProfilesInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Status] status The verification status of the Customer-Profile resource.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, friendly_name: :unset, policy_sid: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            friendly_name: friendly_name,
                            policy_sid: policy_sid,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Status] status The verification status of the Customer-Profile resource.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, friendly_name: :unset, policy_sid: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            friendly_name: friendly_name,
                            policy_sid: policy_sid,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields CustomerProfilesInstance records from the API.
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
                    # Retrieve a single page of CustomerProfilesInstance records from the API.
                    # Request is executed immediately.
                    # @param [Status] status The verification status of the Customer-Profile resource.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of CustomerProfilesInstance
                    def page(status: :unset, friendly_name: :unset, policy_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Status' => status,
                            'FriendlyName' => friendly_name,
                            'PolicySid' => policy_sid,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        CustomerProfilesPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of CustomerProfilesInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of CustomerProfilesInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    CustomerProfilesPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Trusthub.V1.CustomerProfilesList>'
                    end
                end


                class CustomerProfilesContext < InstanceContext
                    ##
                    # Initialize the CustomerProfilesContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The unique string that we created to identify the Customer-Profile resource.
                    # @return [CustomerProfilesContext] CustomerProfilesContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/CustomerProfiles/#{@solution[:sid]}"

                        # Dependents
                        @customer_profiles_channel_endpoint_assignment = nil
                        @customer_profiles_entity_assignments = nil
                        @customer_profiles_evaluations = nil
                    end
                    ##
                    # Delete the CustomerProfilesInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the CustomerProfilesInstance
                    # @return [CustomerProfilesInstance] Fetched CustomerProfilesInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        CustomerProfilesInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the CustomerProfilesInstance
                    # @param [Status] status 
                    # @param [String] status_callback The URL we call to inform your application of status changes.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] email The email address that will receive updates when the Customer-Profile resource changes status.
                    # @return [CustomerProfilesInstance] Updated CustomerProfilesInstance
                    def update(
                        status: :unset, 
                        status_callback: :unset, 
                        friendly_name: :unset, 
                        email: :unset
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                            'StatusCallback' => status_callback,
                            'FriendlyName' => friendly_name,
                            'Email' => email,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        CustomerProfilesInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the customer_profiles_channel_endpoint_assignment
                    # @return [CustomerProfilesChannelEndpointAssignmentList]
                    # @return [CustomerProfilesChannelEndpointAssignmentContext] if sid was passed.
                    def customer_profiles_channel_endpoint_assignment(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return CustomerProfilesChannelEndpointAssignmentContext.new(@version, @solution[:sid],sid )
                        end

                        unless @customer_profiles_channel_endpoint_assignment
                            @customer_profiles_channel_endpoint_assignment = CustomerProfilesChannelEndpointAssignmentList.new(
                                @version, customer_profile_sid: @solution[:sid], )
                        end

                     @customer_profiles_channel_endpoint_assignment
                    end
                    ##
                    # Access the customer_profiles_entity_assignments
                    # @return [CustomerProfilesEntityAssignmentsList]
                    # @return [CustomerProfilesEntityAssignmentsContext] if sid was passed.
                    def customer_profiles_entity_assignments(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return CustomerProfilesEntityAssignmentsContext.new(@version, @solution[:sid],sid )
                        end

                        unless @customer_profiles_entity_assignments
                            @customer_profiles_entity_assignments = CustomerProfilesEntityAssignmentsList.new(
                                @version, customer_profile_sid: @solution[:sid], )
                        end

                     @customer_profiles_entity_assignments
                    end
                    ##
                    # Access the customer_profiles_evaluations
                    # @return [CustomerProfilesEvaluationsList]
                    # @return [CustomerProfilesEvaluationsContext] if sid was passed.
                    def customer_profiles_evaluations(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return CustomerProfilesEvaluationsContext.new(@version, @solution[:sid],sid )
                        end

                        unless @customer_profiles_evaluations
                            @customer_profiles_evaluations = CustomerProfilesEvaluationsList.new(
                                @version, customer_profile_sid: @solution[:sid], )
                        end

                     @customer_profiles_evaluations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.CustomerProfilesContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.CustomerProfilesContext #{context}>"
                    end
                end

                class CustomerProfilesPage < Page
                    ##
                    # Initialize the CustomerProfilesPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [CustomerProfilesPage] CustomerProfilesPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of CustomerProfilesInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [CustomerProfilesInstance] CustomerProfilesInstance
                    def get_instance(payload)
                        CustomerProfilesInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Trusthub.V1.CustomerProfilesPage>'
                    end
                end
                class CustomerProfilesInstance < InstanceResource
                    ##
                    # Initialize the CustomerProfilesInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this CustomerProfiles
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [CustomerProfilesInstance] CustomerProfilesInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'policy_sid' => payload['policy_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'status' => payload['status'],
                            'valid_until' => Twilio.deserialize_iso8601_datetime(payload['valid_until']),
                            'email' => payload['email'],
                            'status_callback' => payload['status_callback'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [CustomerProfilesContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = CustomerProfilesContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Customer-Profile resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Customer-Profile resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string of a policy that is associated to the Customer-Profile resource.
                    def policy_sid
                        @properties['policy_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format when the resource will be valid until.
                    def valid_until
                        @properties['valid_until']
                    end
                    
                    ##
                    # @return [String] The email address that will receive updates when the Customer-Profile resource changes status.
                    def email
                        @properties['email']
                    end
                    
                    ##
                    # @return [String] The URL we call to inform your application of status changes.
                    def status_callback
                        @properties['status_callback']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Customer-Profile resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of the Assigned Items of the Customer-Profile resource.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the CustomerProfilesInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the CustomerProfilesInstance
                    # @return [CustomerProfilesInstance] Fetched CustomerProfilesInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the CustomerProfilesInstance
                    # @param [Status] status 
                    # @param [String] status_callback The URL we call to inform your application of status changes.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] email The email address that will receive updates when the Customer-Profile resource changes status.
                    # @return [CustomerProfilesInstance] Updated CustomerProfilesInstance
                    def update(
                        status: :unset, 
                        status_callback: :unset, 
                        friendly_name: :unset, 
                        email: :unset
                    )

                        context.update(
                            status: status, 
                            status_callback: status_callback, 
                            friendly_name: friendly_name, 
                            email: email, 
                        )
                    end

                    ##
                    # Access the customer_profiles_channel_endpoint_assignment
                    # @return [customer_profiles_channel_endpoint_assignment] customer_profiles_channel_endpoint_assignment
                    def customer_profiles_channel_endpoint_assignment
                        context.customer_profiles_channel_endpoint_assignment
                    end

                    ##
                    # Access the customer_profiles_entity_assignments
                    # @return [customer_profiles_entity_assignments] customer_profiles_entity_assignments
                    def customer_profiles_entity_assignments
                        context.customer_profiles_entity_assignments
                    end

                    ##
                    # Access the customer_profiles_evaluations
                    # @return [customer_profiles_evaluations] customer_profiles_evaluations
                    def customer_profiles_evaluations
                        context.customer_profiles_evaluations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.CustomerProfilesInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.CustomerProfilesInstance #{values}>"
                    end
                end

            end
        end
    end
end
