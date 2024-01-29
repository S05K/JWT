##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Intelligence
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Intelligence
            class V2 < Version
                ##
                # Initialize the V2 version of Intelligence
                def initialize(domain)
                    super
                    @version = 'v2'
                    @services = nil
                    @transcripts = nil
                end

                ##
                # @param [String] sid A 34 character string that uniquely identifies this Service.
                # @return [Twilio::REST::Intelligence::V2::ServiceContext] if sid was passed.
                # @return [Twilio::REST::Intelligence::V2::ServiceList]
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
                # @param [String] sid A 34 character string that uniquely identifies this Transcript.
                # @return [Twilio::REST::Intelligence::V2::TranscriptContext] if sid was passed.
                # @return [Twilio::REST::Intelligence::V2::TranscriptList]
                def transcripts(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @transcripts ||= TranscriptList.new self
                    else
                        TranscriptContext.new(self, sid)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Intelligence::V2>';
                end
            end
        end
    end
end
