class HttpRouter
  class Node
    class GlobRegex < SpanningRegex
      def add_params(request)
        @capturing_indicies.each { |idx| request.params << unescape(match[idx].split('/')) }
      end
    end
  end
end