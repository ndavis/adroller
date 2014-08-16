require "httparty"

Dir[File.dirname(__FILE__) + '/adroll/*.rb'].each do |file|
    require file
end
