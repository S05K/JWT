module Searchable
  require 'faraday' 
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mappings do
      indexes :name, type: 'string'
    end

    def self.search(query)
      params = {
        query: {
          multi_match: {
            query: query,
            fields: ['name'],
            fuzziness: 'AUTO'
          }
        }
      }
      self.__elasticsearch__.search(query)
    end
  end
end
