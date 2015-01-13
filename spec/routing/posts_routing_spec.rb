require "rails_helper"

describe PostsController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: "/posts").to route_to("posts#index")
    end

    it 'routes to #show' do
      expect(get: "/posts/1").to route_to("posts#show", id: "1")
    end
  end
end
