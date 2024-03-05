##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Voice
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Voice < VoiceBase
            class V1 < Version
                class DialingPermissionsList < ListResource

                     class SettingsList < ListResource
                
                    ##
                    # Initialize the SettingsList
                    # @param [Version] version Version that contains the resource
                    # @return [SettingsList] SettingsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Voice.V1.SettingsList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class SettingsContext < InstanceContext
                    ##
                    # Initialize the SettingsContext
                    # @param [Version] version Version that contains the resource
                    # @return [SettingsContext] SettingsContext
                    def initialize(version)
                        super(version)

                        # Path Solution
                        @solution = {  }
                        @uri = "/Settings"

                        
                    end
                    ##
                    # Fetch the SettingsInstance
                    # @return [SettingsInstance] Fetched SettingsInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        SettingsInstance.new(
                            @version,
                            payload,
                        )
                    end

                    ##
                    # Update the SettingsInstance
                    # @param [Boolean] dialing_permissions_inheritance `true` for the sub-account to inherit voice dialing permissions from the Master Project; otherwise `false`.
                    # @return [SettingsInstance] Updated SettingsInstance
                    def update(
                        dialing_permissions_inheritance: :unset
                    )

                        data = Twilio::Values.of({
                            'DialingPermissionsInheritance' => dialing_permissions_inheritance,
                        })

                        
                        payload = @version.update('POST', @uri, data: data)
                        SettingsInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.SettingsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.SettingsContext #{context}>"
                    end
                end

                class SettingsPage < Page
                    ##
                    # Initialize the SettingsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SettingsPage] SettingsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SettingsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SettingsInstance] SettingsInstance
                    def get_instance(payload)
                        SettingsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Voice.V1.SettingsPage>'
                    end
                end
                class SettingsInstance < InstanceResource
                    ##
                    # Initialize the SettingsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Settings
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SettingsInstance] SettingsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'dialing_permissions_inheritance' => payload['dialing_permissions_inheritance'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SettingsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SettingsContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [Boolean] `true` if the sub-account will inherit voice dialing permissions from the Master Project; otherwise `false`.
                    def dialing_permissions_inheritance
                        @properties['dialing_permissions_inheritance']
                    end
                    
                    ##
                    # @return [String] The absolute URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the SettingsInstance
                    # @return [SettingsInstance] Fetched SettingsInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SettingsInstance
                    # @param [Boolean] dialing_permissions_inheritance `true` for the sub-account to inherit voice dialing permissions from the Master Project; otherwise `false`.
                    # @return [SettingsInstance] Updated SettingsInstance
                    def update(
                        dialing_permissions_inheritance: :unset
                    )

                        context.update(
                            dialing_permissions_inheritance: dialing_permissions_inheritance, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.SettingsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.SettingsInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


