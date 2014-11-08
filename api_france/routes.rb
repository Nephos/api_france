#encoding: utf-8

module ApiFrance

  module Routes
    TABLES = {
      '/regions' => Region,
      '/departments' => Department,
      '/cities' => City,
    }
  end

  module Parser
    def self.url(request_uri)
      raise ArgumentError, 'request_uri must be a string' unless request_uri.is_a? String
      return {
        table: Routes::TABLES[URI.parse(request_uri).path],
        params: URI.parse(request_uri).query.to_s.split("&").map{|p|p.split('=')}.to_h,
      }
    end
  end

end
