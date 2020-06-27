class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search = req.path.split("items/").last
      if @@items.find(|x| x.title )
        resp.write "#{search.price}"
      else
        resp.write "Item not found"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
