#encoding: utf-8

module ApiFrance

  def self.get_http_results request
    return {
      count: request.count,
      values: request.limit(Configuration.all['results_limit'])
    }
  end

  def self.api env
    (route = Parser.url(env['REQUEST_URI'])) rescue return [500, {}, ['Internal Server Error']]
    request = route[:table]
    params = route[:params]
    if request
      DB.connect!
      if params.permit(request.column_names).empty?
        request = request.api_search(params)
      else
        request = request.where(params.permit(request.column_names))
      end
      results = get_http_results(request)
      return [200, {}, [{count: results[:count], results: results[:values]}.to_json]]
    else
      return [404, {}, ['404 Not found']]
    end
  end

end
