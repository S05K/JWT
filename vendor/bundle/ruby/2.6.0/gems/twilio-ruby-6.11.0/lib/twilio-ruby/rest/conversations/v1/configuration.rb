##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Conversations
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Conversations < ConversationsBase
            class V1 < Version
                class ConfigurationList < ListResource
                
                    ##
                    # Initialize the ConfigurationList
                    # @param [Version] version Version that contains the resource
                    # @return [ConfigurationList] ConfigurationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Conversations.V1.ConfigurationList>'
                    end
                end


                class ConfigurationContext < InstanceContext
                    ##
                    # Initialize the ConfigurationContext
                    # @param [Version] version Version that contains the resource
                    # @return [ConfigurationContext] ConfigurationContext
                    def initialize(version)
                        super(version)

                        # Path Solution
                        @solution = {  }
                        @uri = "/Configuration"

                        # Dependents
                        @webhooks = nil
                    end
                    ##
                    # Fetch the ConfigurationInstance
                    # @return [ConfigurationInstance] Fetched ConfigurationInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        ConfigurationInstance.new(
                            @version,
                            payload,
                        )
                    end

                    ##
                    # Update the ConfigurationInstance
                    # @param [String] default_chat_service_sid The SID of the default [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) to use when creating a conversation.
                    # @param [String] default_messaging_service_sid The SID of the default [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to use when creating a conversation.
                    # @param [String] default_inactive_timer Default ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute.
                    # @param [String] default_closed_timer Default ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes.
                    # @return [ConfigurationInstance] Updated ConfigurationInstance
                    def update(
                        default_chat_service_sid: :unset, 
                        default_messaging_service_sid: :unset, 
                        default_inactive_timer: :unset, 
                        default_closed_timer: :unset
                    )

                        data = Twilio::Values.of({
                            'DefaultChatServiceSid' => default_chat_service_sid,
                            'DefaultMessagingServiceSid' => default_messaging_service_sid,
                            'DefaultInactiveTimer' => default_inactive_timer,
                            'DefaultClosedTimer' => default_closed_timer,
                        })

                        
                        payload = @version.update('POST', @uri, data: data)
                        ConfigurationInstance.new(
                            @version,
                            payload,
                        )
                    end

                    ##
                    # Access the webhooks
                    # @return [WebhookList]
                    # @return [WebhookContext]
                    def webhooks
                        WebhookContext.new(
                                @version
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.ConfigurationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.ConfigurationContext #{context}>"
                    end
                end

                class ConfigurationPage < Page
                    ##
                    # Initialize the ConfigurationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ConfigurationPage] ConfigurationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ConfigurationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ConfigurationInstance] ConfigurationInstance
                    def get_instance(payload)
                        ConfigurationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Conversations.V1.ConfigurationPage>'
                    end
                end
                class ConfigurationInstance < InstanceResource
                    ##
                    # Initialize the ConfigurationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Configuration
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ConfigurationInstance] ConfigurationInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'default_chat_service_sid' => payload['default_chat_service_sid'],
                            'default_messaging_service_sid' => payload['default_messaging_service_sid'],
                            'default_inactive_timer' => payload['default_inactive_timer'],
                            'default_closed_timer' => payload['default_closed_timer'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ConfigurationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ConfigurationContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this configuration.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the default [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) used when creating a conversation.
                    def default_chat_service_sid
                        @properties['default_chat_service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the default [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) used when creating a conversation.
                    def default_messaging_service_sid
                        @properties['default_messaging_service_sid']
                    end
                    
                    ##
                    # @return [String] Default ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute.
                    def default_inactive_timer
                        @properties['default_inactive_timer']
                    end
                    
                    ##
                    # @return [String] Default ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes.
                    def default_closed_timer
                        @properties['default_closed_timer']
                    end
                    
                    ##
                    # @return [String] An absolute API resource URL for this global configuration.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Contains absolute API resource URLs to access the webhook and default service configurations.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the ConfigurationInstance
                    # @return [ConfigurationInstance] Fetched ConfigurationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ConfigurationInstance
                    # @param [String] default_chat_service_sid The SID of the default [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) to use when creating a conversation.
                    # @param [String] default_messaging_service_sid The SID of the default [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to use when creating a conversation.
                    # @param [String] default_inactive_timer Default ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute.
                    # @param [String] default_closed_timer Default ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes.
                    # @return [ConfigurationInstance] Updated ConfigurationInstance
                    def update(
                        default_chat_service_sid: :unset, 
                        default_messaging_service_sid: :unset, 
                        default_inactive_timer: :unset, 
                        default_closed_timer: :unset
                    )

                        context.update(
                            default_chat_service_sid: default_chat_service_sid, 
                            default_messaging_service_sid: default_messaging_service_sid, 
                            default_inactive_timer: default_inactive_timer, 
                            default_closed_timer: default_closed_timer, 
                        )
                    end

                    ##
                    # Access the webhooks
                    # @return [webhooks] webhooks
                    def webhooks
                        context.webhooks
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.ConfigurationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.ConfigurationInstance #{values}>"
                    end
                end

            end
        end
    end
end
