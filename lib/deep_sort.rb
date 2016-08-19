require 'deep_sort/version'
require 'deep_sort/array'
require 'deep_sort/hash'

module DeepSort
  def deep_sort(obj, options = {})
    case obj
    when Array
      DeepSort::Array.deep_sort(obj, options)
    when Hash
      DeepSort::Hash.deep_sort(obj, options)
    when Enumerable
      if options[:sort_enum]
        DeepSort::Array.deep_sort(obj.to_a, options)
      else
        obj
      end
    else
      obj
    end
  end
  module_function :deep_sort
end
