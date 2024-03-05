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
                class EventList < ListResource
                
                    ##
                    # Initialize the EventList
                    # @param [Version] version Version that contains the resource
                    # @return [EventList] EventList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Events"
                        
                    end
                
                    ##
                    # Lists EventInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] actor_sid Only include events initiated by this Actor. Useful for auditing actions taken by specific users or API credentials.
                    # @param [String] event_type Only include events of this [Event Type](https://www.twilio.com/docs/usage/monitor-events#event-types).
                    # @param [String] resource_sid Only include events that refer to this resource. Useful for discovering the history of a specific resource.
                    # @param [String] source_ip_address Only include events that originated from this IP address. Useful for tracking suspicious activity originating from the API or the Twilio Console.
                    # @param [Time] start_date Only include events that occurred on or after this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Time] end_date Only include events that occurred on or before this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(actor_sid: :unset, event_type: :unset, resource_sid: :unset, source_ip_address: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                        self.stream(
                            actor_sid: actor_sid,
                            event_type: event_type,
                            resource_sid: resource_sid,
                            source_ip_address: source_ip_address,
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
                    # @param [String] actor_sid Only include events initiated by this Actor. Useful for auditing actions taken by specific users or API credentials.
                    # @param [String] event_type Only include events of this [Event Type](https://www.twilio.com/docs/usage/monitor-events#event-types).
                    # @param [String] resource_sid Only include events that refer to this resource. Useful for discovering the history of a specific resource.
                    # @param [String] source_ip_address Only include events that originated from this IP address. Useful for tracking suspicious activity originating from the API or the Twilio Console.
                    # @param [Time] start_date Only include events that occurred on or after this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Time] end_date Only include events that occurred on or before this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(actor_sid: :unset, event_type: :unset, resource_sid: :unset, source_ip_address: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            actor_sid: actor_sid,
                            event_type: event_type,
                            resource_sid: resource_sid,
                            source_ip_address: source_ip_address,
                            start_date: start_date,
                            end_date: end_date,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields EventInstance records from the API.
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
                    # Retrieve a single page of EventInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] actor_sid Only include events initiated by this Actor. Useful for auditing actions taken by specific users or API credentials.
                    # @param [String] event_type Only include events of this [Event Type](https://www.twilio.com/docs/usage/monitor-events#event-types).
                    # @param [String] resource_sid Only include events that refer to this resource. Useful for discovering the history of a specific resource.
                    # @param [String] source_ip_address Only include events that originated from this IP address. Useful for tracking suspicious activity originating from the API or the Twilio Console.
                    # @param [Time] start_date Only include events that occurred on or after this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Time] end_date Only include events that occurred on or before this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of EventInstance
                    def page(actor_sid: :unset, event_type: :unset, resource_sid: :unset, source_ip_address: :unset, start_date: :unset, end_date: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'ActorSid' => actor_sid,
                            'EventType' => event_type,
                            'ResourceSid' => resource_sid,
                            'SourceIpAddress' => source_ip_address,
                            'StartDate' =>  Twilio.serialize_iso8601_datetime(start_date),
                            'EndDate' =>  Twilio.serialize_iso8601_datetime(end_date),
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        EventPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of EventInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of EventInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    EventPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Monitor.V1.EventList>'
                    end
                end


                class EventContext < InstanceContext
                    ##
                    # Initialize the EventContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Event resource to fetch.
                    # @return [EventContext] EventContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Events/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the EventInstance
                    # @return [EventInstance] Fetched EventInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        EventInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Monitor.V1.EventContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Monitor.V1.EventContext #{context}>"
                    end
                end

                class EventPage < Page
                    ##
                    # Initialize the EventPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [EventPage] EventPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of EventInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [EventInstance] EventInstance
                    def get_instance(payload)
                        EventInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Monitor.V1.EventPage>'
                    end
                end
                class EventInstance < InstanceResource
                    ##
                    # Initialize the EventInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Event
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [EventInstance] EventInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'actor_sid' => payload['actor_sid'],
                            'actor_type' => payload['actor_type'],
                            'description' => payload['description'],
                            'event_data' => payload['event_data'],
                            'event_date' => Twilio.deserialize_iso8601_datetime(payload['event_date']),
                            'event_type' => payload['event_type'],
                            'resource_sid' => payload['resource_sid'],
                            'resource_type' => payload['resource_type'],
                            'sid' => payload['sid'],
                            'source' => payload['source'],
                            'source_ip_address' => payload['source_ip_address'],
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
                    # @return [EventContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = EventContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Event resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the actor that caused the event, if available. Can be `null`.
                    def actor_sid
                        @properties['actor_sid']
                    end
                    
                    ##
                    # @return [String] The type of actor that caused the event. Can be: `user` for a change made by a logged-in user in the Twilio Console, `account` for an event caused by an API request by an authenticating Account, `twilio-admin` for an event caused by a Twilio employee, and so on.
                    def actor_type
                        @properties['actor_type']
                    end
                    
                    ##
                    # @return [String] A description of the event. Can be `null`.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Hash] An object with additional data about the event. The  contents depend on `event_type`. For example, event-types of the form `RESOURCE.updated`, this value contains a `resource_properties` dictionary that describes the previous and updated properties of the resource.
                    def event_data
                        @properties['event_data']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the event was recorded specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def event_date
                        @properties['event_date']
                    end
                    
                    ##
                    # @return [String] The event's type. Event-types are typically in the form: `RESOURCE_TYPE.ACTION`, where `RESOURCE_TYPE` is the type of resource that was affected and `ACTION` is what happened to it. For example, `phone-number.created`. For a full list of all event-types, see the [Monitor Event Types](https://www.twilio.com/docs/usage/monitor-events#event-types).
                    def event_type
                        @properties['event_type']
                    end
                    
                    ##
                    # @return [String] The SID of the resource that was affected.
                    def resource_sid
                        @properties['resource_sid']
                    end
                    
                    ##
                    # @return [String] The type of resource that was affected. For a full list of all resource-types, see the [Monitor Event Types](https://www.twilio.com/docs/usage/monitor-events#event-types).
                    def resource_type
                        @properties['resource_type']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Event resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The originating system or interface that caused the event.  Can be: `web` for events caused by user action in the Twilio Console, `api` for events caused by a request to our API, or   `twilio` for events caused by an automated or internal Twilio system.
                    def source
                        @properties['source']
                    end
                    
                    ##
                    # @return [String] The IP address of the source, if the source is outside the Twilio cloud. This value is `null` for events with `source` of `twilio`
                    def source_ip_address
                        @properties['source_ip_address']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource that was affected. Can be `null`.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The absolute URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the EventInstance
                    # @return [EventInstance] Fetched EventInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Monitor.V1.EventInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Monitor.V1.EventInstance #{values}>"
                    end
                end

            end
        end
    end
end
