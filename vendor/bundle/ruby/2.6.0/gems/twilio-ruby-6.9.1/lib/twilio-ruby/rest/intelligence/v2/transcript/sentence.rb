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
        class Intelligence < IntelligenceBase
            class V2 < Version
                class TranscriptContext < InstanceContext

                     class SentenceList < ListResource
                    ##
                    # Initialize the SentenceList
                    # @param [Version] version Version that contains the resource
                    # @return [SentenceList] SentenceList
                    def initialize(version, transcript_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { transcript_sid: transcript_sid }
                        @uri = "/Transcripts/#{@solution[:transcript_sid]}/Sentences"
                        
                    end
                
                    ##
                    # Lists SentenceInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Boolean] redacted Grant access to PII Redacted/Unredacted Sentences. If redaction is enabled, the default is `true` to access redacted sentences.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(redacted: :unset, limit: nil, page_size: nil)
                        self.stream(
                            redacted: redacted,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Boolean] redacted Grant access to PII Redacted/Unredacted Sentences. If redaction is enabled, the default is `true` to access redacted sentences.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(redacted: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            redacted: redacted,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SentenceInstance records from the API.
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
                    # Retrieve a single page of SentenceInstance records from the API.
                    # Request is executed immediately.
                    # @param [Boolean] redacted Grant access to PII Redacted/Unredacted Sentences. If redaction is enabled, the default is `true` to access redacted sentences.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SentenceInstance
                    def page(redacted: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Redacted' => redacted,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        SentencePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SentenceInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SentenceInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SentencePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Intelligence.V2.SentenceList>'
                    end
                end

                class SentencePage < Page
                    ##
                    # Initialize the SentencePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SentencePage] SentencePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SentenceInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SentenceInstance] SentenceInstance
                    def get_instance(payload)
                        SentenceInstance.new(@version, payload, transcript_sid: @solution[:transcript_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Intelligence.V2.SentencePage>'
                    end
                end
                class SentenceInstance < InstanceResource
                    ##
                    # Initialize the SentenceInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Sentence
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SentenceInstance] SentenceInstance
                    def initialize(version, payload , transcript_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'media_channel' => payload['media_channel'] == nil ? payload['media_channel'] : payload['media_channel'].to_i,
                            'sentence_index' => payload['sentence_index'] == nil ? payload['sentence_index'] : payload['sentence_index'].to_i,
                            'start_time' => payload['start_time'],
                            'end_time' => payload['end_time'],
                            'transcript' => payload['transcript'],
                            'sid' => payload['sid'],
                            'confidence' => payload['confidence'],
                        }
                    end

                    
                    ##
                    # @return [String] The channel number.
                    def media_channel
                        @properties['media_channel']
                    end
                    
                    ##
                    # @return [String] The index of the sentence in the transcript.
                    def sentence_index
                        @properties['sentence_index']
                    end
                    
                    ##
                    # @return [Float] Offset from the beginning of the transcript when this sentence starts.
                    def start_time
                        @properties['start_time']
                    end
                    
                    ##
                    # @return [Float] Offset from the beginning of the transcript when this sentence ends.
                    def end_time
                        @properties['end_time']
                    end
                    
                    ##
                    # @return [String] Transcript text.
                    def transcript
                        @properties['transcript']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Sentence.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Float] 
                    def confidence
                        @properties['confidence']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Intelligence.V2.SentenceInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Intelligence.V2.SentenceInstance>"
                    end
                end

             end
            end
        end
    end
end


