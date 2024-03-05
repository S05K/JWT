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
                class ServiceContext < InstanceContext

                     class ConfigurationList < ListResource
                
                    ##
                    # Initialize the ConfigurationList
                    # @param [Version] version Version that contains the resource
                    # @return [ConfigurationList] ConfigurationList
                    def initialize(version, chat_service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { chat_service_sid: chat_service_sid }
                        
                        
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
                    # @param [String] chat_service_sid The SID of the Service configuration resource to update.
                    # @return [ConfigurationContext] ConfigurationContext
                    def initialize(version, chat_service_sid)
                        super(version)

                        # Path Solution
                        @solution = { chat_service_sid: chat_service_sid,  }
                        @uri = "/Services/#{@solution[:chat_service_sid]}/Configuration"

                        # Dependents
                        @notifications = nil
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
                            chat_service_sid: @solution[:chat_service_sid],
                        )
                    end

                    ##
                    # Update the ConfigurationInstance
                    # @param [String] default_conversation_creator_role_sid The conversation-level role assigned to a conversation creator when they join a new conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    # @param [String] default_conversation_role_sid The conversation-level role assigned to users when they are added to a conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    # @param [String] default_chat_service_role_sid The service-level role assigned to users when they are added to the service. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    # @param [Boolean] reachability_enabled Whether the [Reachability Indicator](https://www.twilio.com/docs/conversations/reachability) is enabled for this Conversations Service. The default is `false`.
                    # @return [ConfigurationInstance] Updated ConfigurationInstance
                    def update(
                        default_conversation_creator_role_sid: :unset, 
                        default_conversation_role_sid: :unset, 
                        default_chat_service_role_sid: :unset, 
                        reachability_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'DefaultConversationCreatorRoleSid' => default_conversation_creator_role_sid,
                            'DefaultConversationRoleSid' => default_conversation_role_sid,
                            'DefaultChatServiceRoleSid' => default_chat_service_role_sid,
                            'ReachabilityEnabled' => reachability_enabled,
                        })

                        
                        payload = @version.update('POST', @uri, data: data)
                        ConfigurationInstance.new(
                            @version,
                            payload,
                            chat_service_sid: @solution[:chat_service_sid],
                        )
                    end

                    ##
                    # Access the notifications
                    # @return [NotificationList]
                    # @return [NotificationContext]
                    def notifications
                        NotificationContext.new(
                                @version,
                                @solution[:chat_service_sid]
                                )
                    end
                    ##
                    # Access the webhooks
                    # @return [WebhookList]
                    # @return [WebhookContext]
                    def webhooks
                        WebhookContext.new(
                                @version,
                                @solution[:chat_service_sid]
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
                        ConfigurationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid])
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
                    def initialize(version, payload , chat_service_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'chat_service_sid' => payload['chat_service_sid'],
                            'default_conversation_creator_role_sid' => payload['default_conversation_creator_role_sid'],
                            'default_conversation_role_sid' => payload['default_conversation_role_sid'],
                            'default_chat_service_role_sid' => payload['default_chat_service_role_sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                            'reachability_enabled' => payload['reachability_enabled'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'chat_service_sid' => chat_service_sid  || @properties['chat_service_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ConfigurationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ConfigurationContext.new(@version , @params['chat_service_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Service configuration resource.
                    def chat_service_sid
                        @properties['chat_service_sid']
                    end
                    
                    ##
                    # @return [String] The conversation-level role assigned to a conversation creator when they join a new conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    def default_conversation_creator_role_sid
                        @properties['default_conversation_creator_role_sid']
                    end
                    
                    ##
                    # @return [String] The conversation-level role assigned to users when they are added to a conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    def default_conversation_role_sid
                        @properties['default_conversation_role_sid']
                    end
                    
                    ##
                    # @return [String] The service-level role assigned to users when they are added to the service. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    def default_chat_service_role_sid
                        @properties['default_chat_service_role_sid']
                    end
                    
                    ##
                    # @return [String] An absolute API resource URL for this service configuration.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Contains an absolute API resource URL to access the push notifications configuration of this service.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [Boolean] Whether the [Reachability Indicator](https://www.twilio.com/docs/conversations/reachability) is enabled for this Conversations Service. The default is `false`.
                    def reachability_enabled
                        @properties['reachability_enabled']
                    end
                    
                    ##
                    # Fetch the ConfigurationInstance
                    # @return [ConfigurationInstance] Fetched ConfigurationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ConfigurationInstance
                    # @param [String] default_conversation_creator_role_sid The conversation-level role assigned to a conversation creator when they join a new conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    # @param [String] default_conversation_role_sid The conversation-level role assigned to users when they are added to a conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    # @param [String] default_chat_service_role_sid The service-level role assigned to users when they are added to the service. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles.
                    # @param [Boolean] reachability_enabled Whether the [Reachability Indicator](https://www.twilio.com/docs/conversations/reachability) is enabled for this Conversations Service. The default is `false`.
                    # @return [ConfigurationInstance] Updated ConfigurationInstance
                    def update(
                        default_conversation_creator_role_sid: :unset, 
                        default_conversation_role_sid: :unset, 
                        default_chat_service_role_sid: :unset, 
                        reachability_enabled: :unset
                    )

                        context.update(
                            default_conversation_creator_role_sid: default_conversation_creator_role_sid, 
                            default_conversation_role_sid: default_conversation_role_sid, 
                            default_chat_service_role_sid: default_chat_service_role_sid, 
                            reachability_enabled: reachability_enabled, 
                        )
                    end

                    ##
                    # Access the notifications
                    # @return [notifications] notifications
                    def notifications
                        context.notifications
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
end


