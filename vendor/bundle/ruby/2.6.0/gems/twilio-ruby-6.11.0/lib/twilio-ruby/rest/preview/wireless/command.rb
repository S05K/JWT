##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Preview < PreviewBase
            class Wireless < Version
                class CommandList < ListResource
                
                    ##
                    # Initialize the CommandList
                    # @param [Version] version Version that contains the resource
                    # @return [CommandList] CommandList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Commands"
                        
                    end
                    ##
                    # Create the CommandInstance
                    # @param [String] command 
                    # @param [String] device 
                    # @param [String] sim 
                    # @param [String] callback_method 
                    # @param [String] callback_url 
                    # @param [String] command_mode 
                    # @param [String] include_sid 
                    # @return [CommandInstance] Created CommandInstance
                    def create(
                        command: nil, 
                        device: :unset, 
                        sim: :unset, 
                        callback_method: :unset, 
                        callback_url: :unset, 
                        command_mode: :unset, 
                        include_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'Command' => command,
                            'Device' => device,
                            'Sim' => sim,
                            'CallbackMethod' => callback_method,
                            'CallbackUrl' => callback_url,
                            'CommandMode' => command_mode,
                            'IncludeSid' => include_sid,
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        CommandInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists CommandInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] device 
                    # @param [String] sim 
                    # @param [String] status 
                    # @param [String] direction 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(device: :unset, sim: :unset, status: :unset, direction: :unset, limit: nil, page_size: nil)
                        self.stream(
                            device: device,
                            sim: sim,
                            status: status,
                            direction: direction,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] device 
                    # @param [String] sim 
                    # @param [String] status 
                    # @param [String] direction 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(device: :unset, sim: :unset, status: :unset, direction: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            device: device,
                            sim: sim,
                            status: status,
                            direction: direction,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields CommandInstance records from the API.
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
                    # Retrieve a single page of CommandInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] device 
                    # @param [String] sim 
                    # @param [String] status 
                    # @param [String] direction 
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of CommandInstance
                    def page(device: :unset, sim: :unset, status: :unset, direction: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Device' => device,
                            'Sim' => sim,
                            'Status' => status,
                            'Direction' => direction,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        CommandPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of CommandInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of CommandInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    CommandPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Preview.Wireless.CommandList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class CommandContext < InstanceContext
                    ##
                    # Initialize the CommandContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid 
                    # @return [CommandContext] CommandContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Commands/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the CommandInstance
                    # @return [CommandInstance] Fetched CommandInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        CommandInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.Wireless.CommandContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.Wireless.CommandContext #{context}>"
                    end
                end

                class CommandPage < Page
                    ##
                    # Initialize the CommandPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [CommandPage] CommandPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of CommandInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [CommandInstance] CommandInstance
                    def get_instance(payload)
                        CommandInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Preview.Wireless.CommandPage>'
                    end
                end
                class CommandInstance < InstanceResource
                    ##
                    # Initialize the CommandInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Command
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [CommandInstance] CommandInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'device_sid' => payload['device_sid'],
                            'sim_sid' => payload['sim_sid'],
                            'command' => payload['command'],
                            'command_mode' => payload['command_mode'],
                            'status' => payload['status'],
                            'direction' => payload['direction'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [CommandContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = CommandContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] 
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def device_sid
                        @properties['device_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def sim_sid
                        @properties['sim_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def command
                        @properties['command']
                    end
                    
                    ##
                    # @return [String] 
                    def command_mode
                        @properties['command_mode']
                    end
                    
                    ##
                    # @return [String] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] 
                    def direction
                        @properties['direction']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the CommandInstance
                    # @return [CommandInstance] Fetched CommandInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.Wireless.CommandInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.Wireless.CommandInstance #{values}>"
                    end
                end

            end
        end
    end
end
