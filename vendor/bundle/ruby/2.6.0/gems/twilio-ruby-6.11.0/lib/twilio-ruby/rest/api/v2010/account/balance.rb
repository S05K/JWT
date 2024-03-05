##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext

                     class BalanceList < ListResource
                
                    ##
                    # Initialize the BalanceList
                    # @param [Version] version Version that contains the resource
                    # @return [BalanceList] BalanceList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Balance.json"
                        
                    end
                    ##
                    # Fetch the BalanceInstance
                    # @return [BalanceInstance] Fetched BalanceInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        BalanceInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.BalanceList>'
                    end
                end

                class BalancePage < Page
                    ##
                    # Initialize the BalancePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [BalancePage] BalancePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of BalanceInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [BalanceInstance] BalanceInstance
                    def get_instance(payload)
                        BalanceInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.BalancePage>'
                    end
                end
                class BalanceInstance < InstanceResource
                    ##
                    # Initialize the BalanceInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Balance
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [BalanceInstance] BalanceInstance
                    def initialize(version, payload , account_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'balance' => payload['balance'],
                            'currency' => payload['currency'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The balance of the Account, in units specified by the unit parameter. Balance changes may not be reflected immediately. Child accounts do not contain balance information
                    def balance
                        @properties['balance']
                    end
                    
                    ##
                    # @return [String] The units of currency for the account balance
                    def currency
                        @properties['currency']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Api.V2010.BalanceInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Api.V2010.BalanceInstance>"
                    end
                end

             end
            end
        end
    end
end


