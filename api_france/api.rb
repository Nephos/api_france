#encoding: utf-8

module ApiFrance

  def self.get_http_results request
    return {
      count: request.count,
      values: request.limit(Configuration.all['results_limit'])
    }
  end

  def self.render params
    if params == :empty
      return [200, {}, []]
    elsif params[:status] == 404
      return [404, {}, ['404 Not found']]
    elsif params[:json]
      return [200, {}, [params[:json]]]
    elsif params[:text]
      return [200, {}, [params[:text]]]
    elsif params[:html]
      return [200, {}, [params[:html]]]
    end
  end

  def self.api env
    (route = Parser.url(env['REQUEST_URI'])) rescue return [500, {}, ['Internal Server Error']]
    table = route[:table]
    params = route[:params]
    if table
      return render :empty if params.empty?
      DB.connect!
      permited_params = params.permit(table.column_names)
      request = (permited_params.empty? ?
                 table.api_search(route[:table], params) :
                 table.where(permited_params))
      results = get_http_results(request)
      return render json: {count: results[:count], results: results[:values]}.to_json
    else
      return render status: 404
    end
  end

end
