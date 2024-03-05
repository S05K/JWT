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
        class Preview
            class Sync < Version
                ##
                # Initialize the Sync version of Preview
                def initialize(domain)
                    super
                    @version = 'Sync'
                    @services = nil
                end

                ##
                # @param [String] sid 
                # @return [Twilio::REST::Preview::Sync::ServiceContext] if sid was passed.
                # @return [Twilio::REST::Preview::Sync::ServiceList]
                def services(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @services ||= ServiceList.new self
                    else
                        ServiceContext.new(self, sid)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Preview::Sync>';
                end
            end
        end
    end
end
