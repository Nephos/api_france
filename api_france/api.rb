#encoding: utf-8

module ApiFrance

  def self.api env
    route = Parser.url env['REQUEST_URI'].to_s rescue return [500, {}, ['Internal Server Error']]
    if route[:table]
      DB.connect!
      count = route[:table].where(route[:params]).count
      results = route[:table].where(route[:params]).limit Configuration.all['results_limit']
      return [200, {}, [{count: count, results: results}.to_json]]
    else
      return [404, {}, ['404 Not found']]
    end
  end

end
