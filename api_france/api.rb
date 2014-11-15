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
    table = route[:table]
    params = route[:params]
    if table
      DB.connect!
      permited_params = params.permit(table.column_names).except('zipcode')
      request = (params.permit(permited_params).empty? ?
                 table.api_search(route[:table], params) :
                 table.where(permited_params))
      results = get_http_results(request)
      return [200, {}, [{count: results[:count], results: results[:values]}.to_json]]
    else
      return [404, {}, ['404 Not found']]
    end
  end

end
