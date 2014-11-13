#encoding: utf-8

module StringExtendSql
  def sql_parse_like
    return self.to_s.gsub('*', '%').gsub('?', '_')
  end
end

class String
  prepend StringExtendSql
end
