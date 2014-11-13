#encoding: utf-8

module ApiFrance

  def self.api env
    route = Parser.url env['REQUEST_URI'].to_s rescue return [500, {}, ['Internal Server Error']]
    @request = route[:table]
    params = route[:params]
    if @request
      DB.connect!
      if (@request.column_names & params.keys.map(&:to_s)).empty?
        # special requests
      else
        @request = @request.where(params.permit(@request.column_names))
      end
      count = @request.count
      results = @request.limit(Configuration.all['results_limit'])
      return [200, {}, [{count: count, results: results}.to_json]]
    else
      return [404, {}, ['404 Not found']]
    end
  end

end
