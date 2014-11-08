#encoding: utf-8

module ApiFrance

  module Routes
    TABLES = {
      regions: '/regions',
      departments: '/departments',
      towns: '/towns',
    }
  end

  module Parser
    def self.url(request_uri)
      raise ArgumentError, 'request_uri must be a string' unless request_uri.is_a? String
      return {
        table: URI.parse(request_uri).path
        params: URI.parse(request_uri).query.split("&").map{|p|p.split('=')}.to_h
      }
    end
  end

end
