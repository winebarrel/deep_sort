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
        value.deep_sort(options)
      when Enumerable
        if options[:sort_enum]
          value.to_a.deep_sort(options)
        else
          value
        end
      else
        value
      end
    }.sort_by(&:to_s)
  end
end
