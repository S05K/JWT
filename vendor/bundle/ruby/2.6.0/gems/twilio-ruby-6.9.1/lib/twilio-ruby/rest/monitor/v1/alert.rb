##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Monitor
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Monitor < MonitorBase
            class V1 < Version
                class AlertList < ListResource
                    ##
                    # Initialize the AlertList
                    # @param [Version] version Version that contains the resource
                    # @return [AlertList] AlertList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Alerts"
                        
                    end
                
                    ##
                    # Lists AlertInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] log_level Only show alerts for this log-level.  Can be: `error`, `warning`, `notice`, or `debug`.
                    # @param [Time] start_date Only include alerts that occurred on or after this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported.
                    # @param [Time] end_date Only include alerts that occurred on or before this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(log_level: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                        self.stream(
                            log_level: log_level,
                            start_date: start_date,
                            end_date: end_date,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] log_level Only show alerts for this log-level.  Can be: `error`, `warning`, `notice`, or `debug`.
                    # @param [Time] start_date Only include alerts that occurred on or after this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported.
                    # @param [Time] end_date Only include alerts that occurred on or before this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(log_level: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            log_level: log_level,
                            start_date: start_date,
                            end_date: end_date,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AlertInstance records from the API.
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
                    # Retrieve a single page of AlertInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] log_level Only show alerts for this log-level.  Can be: `error`, `warning`, `notice`, or `debug`.
                    # @param [Time] start_date Only include alerts that occurred on or after this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported.
                    # @param [Time] end_date Only include alerts that occurred on or before this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AlertInstance
                    def page(log_level: :unset, start_date: :unset, end_date: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'LogLevel' => log_level,
                            'StartDate' =>  Twilio.serialize_iso8601_datetime(start_date),
                            'EndDate' =>  Twilio.serialize_iso8601_datetime(end_date),
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AlertPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AlertInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AlertInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AlertPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Monitor.V1.AlertList>'
                    end
                end


                class AlertContext < InstanceContext
                    ##
                    # Initialize the AlertContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Alert resource to fetch.
                    # @return [AlertContext] AlertContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Alerts/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the AlertInstance
                    # @return [AlertInstance] Fetched AlertInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        AlertInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Monitor.V1.AlertContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Monitor.V1.AlertContext #{context}>"
                    end
                end

                class AlertPage < Page
                    ##
                    # Initialize the AlertPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AlertPage] AlertPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AlertInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AlertInstance] AlertInstance
                    def get_instance(payload)
                        AlertInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Monitor.V1.AlertPage>'
                    end
                end
                class AlertInstance < InstanceResource
                    ##
                    # Initialize the AlertInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Alert
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AlertInstance] AlertInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'alert_text' => payload['alert_text'],
                            'api_version' => payload['api_version'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_generated' => Twilio.deserialize_iso8601_datetime(payload['date_generated']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'error_code' => payload['error_code'],
                            'log_level' => payload['log_level'],
                            'more_info' => payload['more_info'],
                            'request_method' => payload['request_method'],
                            'request_url' => payload['request_url'],
                            'request_variables' => payload['request_variables'],
                            'resource_sid' => payload['resource_sid'],
                            'response_body' => payload['response_body'],
                            'response_headers' => payload['response_headers'],
                            'sid' => payload['sid'],
                            'url' => payload['url'],
                            'request_headers' => payload['request_headers'],
                            'service_sid' => payload['service_sid'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AlertContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AlertContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Alert resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The text of the alert.
                    def alert_text
                        @properties['alert_text']
                    end
                    
                    ##
                    # @return [String] The API version used when the alert was generated.  Can be empty for events that don't have a specific API version.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the alert was generated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.  Due to buffering, this can be different than `date_created`.
                    def date_generated
                        @properties['date_generated']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The error code for the condition that generated the alert. See the [Error Dictionary](https://www.twilio.com/docs/api/errors) for possible causes and solutions to the error.
                    def error_code
                        @properties['error_code']
                    end
                    
                    ##
                    # @return [String] The log level.  Can be: `error`, `warning`, `notice`, or `debug`.
                    def log_level
                        @properties['log_level']
                    end
                    
                    ##
                    # @return [String] The URL of the page in our [Error Dictionary](https://www.twilio.com/docs/api/errors) with more information about the error condition.
                    def more_info
                        @properties['more_info']
                    end
                    
                    ##
                    # @return [String] The method used by the request that generated the alert. If the alert was generated by a request we made to your server, this is the method we used. If the alert was generated by a request from your application to our API, this is the method your application used.
                    def request_method
                        @properties['request_method']
                    end
                    
                    ##
                    # @return [String] The URL of the request that generated the alert. If the alert was generated by a request we made to your server, this is the URL on your server that generated the alert. If the alert was generated by a request from your application to our API, this is the URL of the resource requested.
                    def request_url
                        @properties['request_url']
                    end
                    
                    ##
                    # @return [String] The variables passed in the request that generated the alert. This value is only returned when a single Alert resource is fetched.
                    def request_variables
                        @properties['request_variables']
                    end
                    
                    ##
                    # @return [String] The SID of the resource for which the alert was generated.  For instance, if your server failed to respond to an HTTP request during the flow of a particular call, this value would be the SID of the server.  This value is empty if the alert was not generated for a particular resource.
                    def resource_sid
                        @properties['resource_sid']
                    end
                    
                    ##
                    # @return [String] The response body of the request that generated the alert. This value is only returned when a single Alert resource is fetched.
                    def response_body
                        @properties['response_body']
                    end
                    
                    ##
                    # @return [String] The response headers of the request that generated the alert. This value is only returned when a single Alert resource is fetched.
                    def response_headers
                        @properties['response_headers']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Alert resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Alert resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The request headers of the request that generated the alert. This value is only returned when a single Alert resource is fetched.
                    def request_headers
                        @properties['request_headers']
                    end
                    
                    ##
                    # @return [String] The SID of the service or resource that generated the alert. Can be `null`.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # Fetch the AlertInstance
                    # @return [AlertInstance] Fetched AlertInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Monitor.V1.AlertInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Monitor.V1.AlertInstance #{values}>"
                    end
                end

            end
        end
    end
end
