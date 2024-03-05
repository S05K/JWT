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
                class ConversationContext < InstanceContext

                     class ParticipantList < ListResource
                
                    ##
                    # Initialize the ParticipantList
                    # @param [Version] version Version that contains the resource
                    # @return [ParticipantList] ParticipantList
                    def initialize(version, conversation_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { conversation_sid: conversation_sid }
                        @uri = "/Conversations/#{@solution[:conversation_sid]}/Participants"
                        
                    end
                    ##
                    # Create the ParticipantInstance
                    # @param [String] identity A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    # @param [String] messaging_binding_address The address of the participant's device, e.g. a phone or WhatsApp number. Together with the Proxy address, this determines a participant uniquely. This field (with proxy_address) is only null when the participant is interacting from an SDK endpoint (see the 'identity' field).
                    # @param [String] messaging_binding_proxy_address The address of the Twilio phone number (or WhatsApp number) that the participant is in contact with. This field, together with participant address, is only null when the participant is interacting from an SDK endpoint (see the 'identity' field).
                    # @param [Time] date_created The date that this resource was created.
                    # @param [Time] date_updated The date that this resource was last updated.
                    # @param [String] attributes An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set \\\"{}\\\" will be returned.
                    # @param [String] messaging_binding_projected_address The address of the Twilio phone number that is used in Group MMS. Communication mask for the Conversation participant with Identity.
                    # @param [String] role_sid The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant.
                    # @param [ConversationParticipantEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [ParticipantInstance] Created ParticipantInstance
                    def create(
                        identity: :unset, 
                        messaging_binding_address: :unset, 
                        messaging_binding_proxy_address: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        attributes: :unset, 
                        messaging_binding_projected_address: :unset, 
                        role_sid: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'Identity' => identity,
                            'MessagingBinding.Address' => messaging_binding_address,
                            'MessagingBinding.ProxyAddress' => messaging_binding_proxy_address,
                            'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                            'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                            'Attributes' => attributes,
                            'MessagingBinding.ProjectedAddress' => messaging_binding_projected_address,
                            'RoleSid' => role_sid,
                        })

                        
                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ParticipantInstance.new(
                            @version,
                            payload,
                            conversation_sid: @solution[:conversation_sid],
                        )
                    end

                
                    ##
                    # Lists ParticipantInstance records from the API as a list.
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
                    # When passed a block, yields ParticipantInstance records from the API.
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
                    # Retrieve a single page of ParticipantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ParticipantInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ParticipantPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ParticipantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ParticipantInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ParticipantPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Conversations.V1.ParticipantList>'
                    end
                end


                class ParticipantContext < InstanceContext
                    ##
                    # Initialize the ParticipantContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] conversation_sid The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this participant.
                    # @param [String] sid A 34 character string that uniquely identifies this resource.
                    # @return [ParticipantContext] ParticipantContext
                    def initialize(version, conversation_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { conversation_sid: conversation_sid, sid: sid,  }
                        @uri = "/Conversations/#{@solution[:conversation_sid]}/Participants/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the ParticipantInstance
                    # @param [ConversationParticipantEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        
                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the ParticipantInstance
                    # @return [ParticipantInstance] Fetched ParticipantInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        ParticipantInstance.new(
                            @version,
                            payload,
                            conversation_sid: @solution[:conversation_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ParticipantInstance
                    # @param [Time] date_created The date that this resource was created.
                    # @param [Time] date_updated The date that this resource was last updated.
                    # @param [String] attributes An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set \\\"{}\\\" will be returned.
                    # @param [String] role_sid The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant.
                    # @param [String] messaging_binding_proxy_address The address of the Twilio phone number that the participant is in contact with. 'null' value will remove it.
                    # @param [String] messaging_binding_projected_address The address of the Twilio phone number that is used in Group MMS. 'null' value will remove it.
                    # @param [String] identity A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    # @param [String] last_read_message_index Index of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant.
                    # @param [String] last_read_timestamp Timestamp of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant.
                    # @param [ConversationParticipantEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [ParticipantInstance] Updated ParticipantInstance
                    def update(
                        date_created: :unset, 
                        date_updated: :unset, 
                        attributes: :unset, 
                        role_sid: :unset, 
                        messaging_binding_proxy_address: :unset, 
                        messaging_binding_projected_address: :unset, 
                        identity: :unset, 
                        last_read_message_index: :unset, 
                        last_read_timestamp: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                            'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                            'Attributes' => attributes,
                            'RoleSid' => role_sid,
                            'MessagingBinding.ProxyAddress' => messaging_binding_proxy_address,
                            'MessagingBinding.ProjectedAddress' => messaging_binding_projected_address,
                            'Identity' => identity,
                            'LastReadMessageIndex' => last_read_message_index,
                            'LastReadTimestamp' => last_read_timestamp,
                        })

                        
                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ParticipantInstance.new(
                            @version,
                            payload,
                            conversation_sid: @solution[:conversation_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.ParticipantContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.ParticipantContext #{context}>"
                    end
                end

                class ParticipantPage < Page
                    ##
                    # Initialize the ParticipantPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ParticipantPage] ParticipantPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ParticipantInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ParticipantInstance] ParticipantInstance
                    def get_instance(payload)
                        ParticipantInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Conversations.V1.ParticipantPage>'
                    end
                end
                class ParticipantInstance < InstanceResource
                    ##
                    # Initialize the ParticipantInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Participant
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ParticipantInstance] ParticipantInstance
                    def initialize(version, payload , conversation_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'conversation_sid' => payload['conversation_sid'],
                            'sid' => payload['sid'],
                            'identity' => payload['identity'],
                            'attributes' => payload['attributes'],
                            'messaging_binding' => payload['messaging_binding'],
                            'role_sid' => payload['role_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'last_read_message_index' => payload['last_read_message_index'] == nil ? payload['last_read_message_index'] : payload['last_read_message_index'].to_i,
                            'last_read_timestamp' => payload['last_read_timestamp'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'conversation_sid' => conversation_sid  || @properties['conversation_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ParticipantContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ParticipantContext.new(@version , @params['conversation_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this participant.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this participant.
                    def conversation_sid
                        @properties['conversation_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set \"{}\" will be returned.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [Hash] Information about how this participant exchanges messages with the conversation. A JSON parameter consisting of type and address fields of the participant.
                    def messaging_binding
                        @properties['messaging_binding']
                    end
                    
                    ##
                    # @return [String] The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant.
                    def role_sid
                        @properties['role_sid']
                    end
                    
                    ##
                    # @return [Time] The date that this resource was created.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this resource was last updated.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] An absolute API resource URL for this participant.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] Index of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant.
                    def last_read_message_index
                        @properties['last_read_message_index']
                    end
                    
                    ##
                    # @return [String] Timestamp of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant.
                    def last_read_timestamp
                        @properties['last_read_timestamp']
                    end
                    
                    ##
                    # Delete the ParticipantInstance
                    # @param [ConversationParticipantEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        context.delete(
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Fetch the ParticipantInstance
                    # @return [ParticipantInstance] Fetched ParticipantInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ParticipantInstance
                    # @param [Time] date_created The date that this resource was created.
                    # @param [Time] date_updated The date that this resource was last updated.
                    # @param [String] attributes An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set \\\"{}\\\" will be returned.
                    # @param [String] role_sid The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant.
                    # @param [String] messaging_binding_proxy_address The address of the Twilio phone number that the participant is in contact with. 'null' value will remove it.
                    # @param [String] messaging_binding_projected_address The address of the Twilio phone number that is used in Group MMS. 'null' value will remove it.
                    # @param [String] identity A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    # @param [String] last_read_message_index Index of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant.
                    # @param [String] last_read_timestamp Timestamp of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant.
                    # @param [ConversationParticipantEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [ParticipantInstance] Updated ParticipantInstance
                    def update(
                        date_created: :unset, 
                        date_updated: :unset, 
                        attributes: :unset, 
                        role_sid: :unset, 
                        messaging_binding_proxy_address: :unset, 
                        messaging_binding_projected_address: :unset, 
                        identity: :unset, 
                        last_read_message_index: :unset, 
                        last_read_timestamp: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        context.update(
                            date_created: date_created, 
                            date_updated: date_updated, 
                            attributes: attributes, 
                            role_sid: role_sid, 
                            messaging_binding_proxy_address: messaging_binding_proxy_address, 
                            messaging_binding_projected_address: messaging_binding_projected_address, 
                            identity: identity, 
                            last_read_message_index: last_read_message_index, 
                            last_read_timestamp: last_read_timestamp, 
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.ParticipantInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.ParticipantInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


