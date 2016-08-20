require 'deep_sort/version'
require 'deep_sort/array_ext'
require 'deep_sort/hash_ext'

module DeepSort
  def deep_sort(obj, options = {})
    if obj.is_a?(Array)
      DeepSort::ArrayExt.deep_sort(obj, options)
    elsif obj.is_a?(Hash)
      DeepSort::HashExt.deep_sort(obj, options)
    elsif options[:sort_enum] and obj.is_a?(Enumerable)
      DeepSort::ArrayExt.deep_sort(obj.to_a, options)
    else
      obj
    end
  end
  module_function :deep_sort
end
