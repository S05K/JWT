##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Messaging
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Messaging < MessagingBase
            class V1 < Version
                class UsecaseList < ListResource
                    ##
                    # Initialize the UsecaseList
                    # @param [Version] version Version that contains the resource
                    # @return [UsecaseList] UsecaseList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Services/Usecases"
                        
                    end
                    ##
                    # Fetch the UsecaseInstance
                    # @return [UsecaseInstance] Fetched UsecaseInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        UsecaseInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Messaging.V1.UsecaseList>'
                    end
                end

                class UsecasePage < Page
                    ##
                    # Initialize the UsecasePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UsecasePage] UsecasePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UsecaseInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UsecaseInstance] UsecaseInstance
                    def get_instance(payload)
                        UsecaseInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Messaging.V1.UsecasePage>'
                    end
                end
                class UsecaseInstance < InstanceResource
                    ##
                    # Initialize the UsecaseInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Usecase
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UsecaseInstance] UsecaseInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'usecases' => payload['usecases'],
                        }
                    end

                    
                    ##
                    # @return [Array<Hash>] Human readable use case details (usecase, description and purpose) of Messaging Service Use Cases.
                    def usecases
                        @properties['usecases']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Messaging.V1.UsecaseInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Messaging.V1.UsecaseInstance>"
                    end
                end

            end
        end
    end
end
