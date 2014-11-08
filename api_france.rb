require 'rack'
require 'active_record'

require_relative 'api_france/db'
require_relative 'api_france/city'
require_relative 'api_france/department'
require_relative 'api_france/region'
require_relative 'api_france/api'

include ApiFrance
