require 'json'

class Post

  def initialize
    # binding.pry
  end

  def self.fetch
    response = EARTHSKY_API.get 'api/v1/tonight'
    post = JSON.parse(response.body)["tonight"]

    return self.transform_for_ifttt(post)
  end

  def self.archive(count)
    response = EARTHSKY_API.get 'api/v1/tonight/archive' do |request|
      request.params['count'] = count
    end

    posts = JSON.parse(response.body)["archive"]
    posts.map! { |post| self.transform_for_ifttt(post) }
  end

private
  def self.transform_for_ifttt(post)
    date = post['date'].to_s
    post['meta'] = { 'id' => date, 'timestamp' => Time.parse(date).to_i }
    return post
  end

end
