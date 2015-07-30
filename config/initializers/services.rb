EARTHSKY_API = Faraday.new(url: ENV['EARTHSKY_API_URL']) do |faraday|
  faraday.adapter Faraday.default_adapter
end
