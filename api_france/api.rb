#encoding: utf-8

module ApiFrance

  def self.get_http_results request
    return {
      count: request.count,
      values: request.limit(Configuration.all['results_limit'])
    }
  end

  CA_CTRL = {'Cache-Control' => 'max-age=36000'}
  CT_CHARSET_ = '; charset=UTF-8'
  CT_TP = {'Content-type' => 'text/plain' + CT_CHARSET_}
  CT_TJ = {'Content-type' => 'text/javascript' + CT_CHARSET_}
  CT_TH = {'Content-type' => 'text/html' + CT_CHARSET_}
  def self.render params
    if params == :empty
      return [204, CA_CTRL+CT_TP, [""]]
    elsif params[:status] == 404
      return [404, CA_CTRL+CT_TP, ['Error 404 : Not found']]
    elsif params[:status] == 500
      return [500, CA_CTRL+CT_TP, ['Error 5OO : Internal Server Error']]
    elsif params[:status].is_a? Fixnum
      return [params[:status], CA_CTRL+CT_TP, ["Error #{params[:status]}"]]
    elsif params[:json]
      return [200, CA_CTRL+CT_TJ, [params[:json]]]
    elsif params[:text]
      return [200, CA_CTRL+CT_TP, [params[:text]]]
    elsif params[:html]
      return [200, CA_CTRL+CT_TP, [params[:html]]]
    end
  end

  def self.api env
    (route = Parser.url(env['REQUEST_URI'])) rescue return render status: 500
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
      return render :empty
    end
  end

end
