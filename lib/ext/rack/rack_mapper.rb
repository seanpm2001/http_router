# Replacement for {Rack::Builder} which using Usher to map requests instead of a simple Hash.
# As well, add convenience methods for the request methods.
class Rack::Builder
  def initialize(&block)
    @router = HttpRouter.new
    super
  end
  
  # Maps a path to a block.
  # @param path [String] Path to map to.
  # @param options [Hash] Options for added path.
  # @see Usher#add_route
  def map(path, options = nil, &block)
    @router.add(path).with_options(options).to(&block)
    @ins << @router unless @ins.last == @router
  end

  # Maps a path with request methods `HEAD` and `GET` to a block.
  # @param path [String] Path to map to.
  # @param options [Hash] Options for added path.
  # @see Usher#add_route
  def get(path, options = nil, &block)
    @router.get(path).with_options(options).to(&block)
  end

  # Maps a path with request methods `POST` to a block.
  # @param path [String] Path to map to.
  # @param options [Hash] Options for added path.
  # @see Usher#add_route
  def post(path, options = nil, &block)
    @router.post(path).with_options(options).to(&block)
  end

  # Maps a path with request methods `PUT` to a block.
  # @param path [String] Path to map to.
  # @param options [Hash] Options for added path.
  # @see Usher#add_route
  def put(path, options = nil, &block)
    @router.put(path).with_options(options).to(&block)
  end

  # Maps a path with request methods `DELETE` to a block.
  # @param path [String] Path to map to.
  # @param options [Hash] Options for added path.
  # @see Usher#add_route
  def delete(path, options = nil, &block)
    @router.delete(path).with_options(options).to(&block)
  end

  # Maps a path with request methods `HEAD` to a block.
  # @param path [String] Path to map to.
  # @param options [Hash] Options for added path.
  # @see Usher#add_route
  def head(path, options = nil, &block)
    @router.head(path).with_options(options).to(&block)
  end
end