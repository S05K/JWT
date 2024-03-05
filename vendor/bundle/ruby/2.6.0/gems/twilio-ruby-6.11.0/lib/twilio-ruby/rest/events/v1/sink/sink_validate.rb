##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Events
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Events < EventsBase
            class V1 < Version
                class SinkContext < InstanceContext

                     class SinkValidateList < ListResource
                
                    ##
                    # Initialize the SinkValidateList
                    # @param [Version] version Version that contains the resource
                    # @return [SinkValidateList] SinkValidateList
                    def initialize(version, sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sid: sid }
                        @uri = "/Sinks/#{@solution[:sid]}/Validate"
                        
                    end
                    ##
                    # Create the SinkValidateInstance
                    # @param [String] test_id A 34 character string that uniquely identifies the test event for a Sink being validated.
                    # @return [SinkValidateInstance] Created SinkValidateInstance
                    def create(
                        test_id: nil
                    )

                        data = Twilio::Values.of({
                            'TestId' => test_id,
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        SinkValidateInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Events.V1.SinkValidateList>'
                    end
                end

                class SinkValidatePage < Page
                    ##
                    # Initialize the SinkValidatePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SinkValidatePage] SinkValidatePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SinkValidateInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SinkValidateInstance] SinkValidateInstance
                    def get_instance(payload)
                        SinkValidateInstance.new(@version, payload, sid: @solution[:sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Events.V1.SinkValidatePage>'
                    end
                end
                class SinkValidateInstance < InstanceResource
                    ##
                    # Initialize the SinkValidateInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SinkValidate
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SinkValidateInstance] SinkValidateInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'result' => payload['result'],
                        }
                    end

                    
                    ##
                    # @return [String] Feedback indicating whether the given Sink was validated.
                    def result
                        @properties['result']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Events.V1.SinkValidateInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Events.V1.SinkValidateInstance>"
                    end
                end

             end
            end
        end
    end
end


