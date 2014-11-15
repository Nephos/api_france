# encoding: utf-8

module Searchable
  def api_search(table, params)
    out = self
    out = out.where('name LIKE ?', params['name_like'].sql_parse_like) if params['name_like']
    out = out.where('id >= ?', params['id_greater'].sql_parse_like) if params['id_greater']
    out = out.where('id <= ?', params['id_lesser'].sql_parse_like) if params['id_lesser']
    out = out.where('zipcode LIKE (\'%?%\')', params['zipcode'].to_i) if table == City and params['zipcode']
    return out
  end
end
