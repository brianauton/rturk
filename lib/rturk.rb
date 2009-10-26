module RTurk
  require 'rturk/logger'

  SANDBOX = 'http://mechanicalturk.sandbox.amazonaws.com/'
  PRODUCTION = 'http://mechanicalturk.amazonaws.com/'
  class << self
    attr_reader :access_key, :secret_key, :host

    def setup(access_key, secret_key, opts ={})
      @access_key = access_key
      @secret_key = secret_key
      @host = opts[:sandbox] ? SANDBOX : PRODUCTION
    end
    
    def sandbox?
      @host == SANDBOX
    end
    
    def log
      RTurk::Logger.logger
    end

  end

end

require 'rturk/utilities'
require 'rturk/xml_utilities'
require 'rturk/requester'
require 'rturk/response'
Dir.glob(File.join(File.dirname(__FILE__), 'rturk', 'responses', '*.rb')).each {|f| require f }
require 'rturk/operation'
Dir.glob(File.join(File.dirname(__FILE__), 'rturk', 'operations', '*.rb')).each {|f| require f }
Dir.glob(File.join(File.dirname(__FILE__), 'rturk', 'builders', '*.rb')).each {|f| require f }
Dir.glob(File.join(File.dirname(__FILE__), 'rturk', 'adapters', '*.rb')).each {|f| require f }
Dir.glob(File.join(File.dirname(__FILE__), 'rturk', 'parsers', '*.rb')).each {|f| require f }

require 'rturk/errors'