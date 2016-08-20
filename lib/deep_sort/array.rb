module DeepSort::Array
  def deep_sort!(options = {})
    new_array = self.deep_sort(options)
    self.replace(new_array)
  end

  def deep_sort(options)
    DeepSort::Array.deep_sort(self, options)
  end

  def self.deep_sort(array, options = {})
    array.map {|value|
      case value
      when Array, Hash
        DeepSort.deep_sort(value, options)
      when Enumerable
        if options[:sort_enum]
          DeepSort.deep_sort(value.to_a, options)
        else
          value
        end
      else
        value
      end
    }.sort_by(&:to_s)
  end
end
