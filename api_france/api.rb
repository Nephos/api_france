#encoding: utf-8

require 'pry'

module ApiFrance
  DB.connect!
  SERVER = lambda do |env|
    route = Parser.url(env['REQUEST_URI'].to_s)
    if route[:table]
      r = route[:table].where(route[:params]).limit DB::RESULTS_LIMIT
      return [200, {}, [r.to_json]]
    else
      return [404, {}, ['404 Not found']]
    end
  end
end
