# encoding: utf-8

module Searchable
  def sql_parse_like(string)
    return string.to_s.gsub('*', '%').gsub('?', '_')
  end

  def api_search(params)
    out = self
    out = out.where('name LIKE ?', sql_parse_like(params['name_like']))
    return out
  end
end
