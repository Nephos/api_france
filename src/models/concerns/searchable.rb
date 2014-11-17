# encoding: utf-8

module Searchable
  def api_search(table, params)
    out = self
    out = out.where('name LIKE ?', params['name_like'].sql_parse_like) if params['name_like']
    out = out.where('id >= ?', params['id_greater'].to_i) if params['id_greater']
    out = out.where('id <= ?', params['id_lesser'].to_i) if params['id_lesser']
    if table == City and params['has_zipcode']
      zipcode = params['has_zipcode'].to_s.downcase.gsub(/\D/, '') # custom sanitize
      zipcode = ('0' * (5-zipcode.size)) + zipcode
      out = out.where("zipcode LIKE (\'%#{zipcode}%\')")
    end
    return out
  end
end
