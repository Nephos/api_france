# encoding: utf-8

module Searchable
  def api_search(params)
    out = self
    out = out.where('name LIKE ?', params['name_like'].sql_parse_like) if params['name_like']
    out = out.where('id >= ?', params['id_greater'].sql_parse_like) if params['id_greater']
    out = out.where('id <= ?', params['id_lesser'].sql_parse_like) if params['id_lesser']
    return out
  end
end
