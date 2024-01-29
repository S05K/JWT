##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Verify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Verify < VerifyBase
            class V2 < Version
                class ServiceContext < InstanceContext

                     class RateLimitList < ListResource
                    ##
                    # Initialize the RateLimitList
                    # @param [Version] version Version that contains the resource
                    # @return [RateLimitList] RateLimitList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/RateLimits"
                        
                    end
                    ##
                    # Create the RateLimitInstance
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this Rate Limit, assigned by the developer, to be optionally used in addition to SID. **This value should not contain PII.**
                    # @param [String] description Description of this Rate Limit
                    # @return [RateLimitInstance] Created RateLimitInstance
                    def create(
                        unique_name: nil, 
                        description: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'Description' => description,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        RateLimitInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists RateLimitInstance records from the API as a list.
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
                    # When passed a block, yields RateLimitInstance records from the API.
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
                    # Retrieve a single page of RateLimitInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of RateLimitInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        RateLimitPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of RateLimitInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of RateLimitInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    RateLimitPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.RateLimitList>'
                    end
                end


                class RateLimitContext < InstanceContext
                    ##
                    # Initialize the RateLimitContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Rate Limit resource to fetch.
                    # @return [RateLimitContext] RateLimitContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/RateLimits/#{@solution[:sid]}"

                        # Dependents
                        @buckets = nil
                    end
                    ##
                    # Delete the RateLimitInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the RateLimitInstance
                    # @return [RateLimitInstance] Fetched RateLimitInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        RateLimitInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the RateLimitInstance
                    # @param [String] description Description of this Rate Limit
                    # @return [RateLimitInstance] Updated RateLimitInstance
                    def update(
                        description: :unset
                    )

                        data = Twilio::Values.of({
                            'Description' => description,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        RateLimitInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the buckets
                    # @return [BucketList]
                    # @return [BucketContext] if sid was passed.
                    def buckets(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return BucketContext.new(@version, @solution[:service_sid], @solution[:sid],sid )
                        end

                        unless @buckets
                            @buckets = BucketList.new(
                                @version, service_sid: @solution[:service_sid], rate_limit_sid: @solution[:sid], )
                        end

                     @buckets
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.RateLimitContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.RateLimitContext #{context}>"
                    end
                end

                class RateLimitPage < Page
                    ##
                    # Initialize the RateLimitPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RateLimitPage] RateLimitPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RateLimitInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RateLimitInstance] RateLimitInstance
                    def get_instance(payload)
                        RateLimitInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.RateLimitPage>'
                    end
                end
                class RateLimitInstance < InstanceResource
                    ##
                    # Initialize the RateLimitInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this RateLimit
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RateLimitInstance] RateLimitInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'service_sid' => payload['service_sid'],
                            'account_sid' => payload['account_sid'],
                            'unique_name' => payload['unique_name'],
                            'description' => payload['description'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [RateLimitContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = RateLimitContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Rate Limit.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Rate Limit resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] Provides a unique and addressable name to be assigned to this Rate Limit, assigned by the developer, to be optionally used in addition to SID. **This value should not contain PII.**
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] Description of this Rate Limit
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the RateLimitInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the RateLimitInstance
                    # @return [RateLimitInstance] Fetched RateLimitInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the RateLimitInstance
                    # @param [String] description Description of this Rate Limit
                    # @return [RateLimitInstance] Updated RateLimitInstance
                    def update(
                        description: :unset
                    )

                        context.update(
                            description: description, 
                        )
                    end

                    ##
                    # Access the buckets
                    # @return [buckets] buckets
                    def buckets
                        context.buckets
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.RateLimitInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.RateLimitInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


