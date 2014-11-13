# encoding: utf-8

module Searchable
  def api_search(params)
    out = self
    out = out.where('name LIKE ?', params['name_like'].to_s.sql_parse_like)
    return out
  end
end
