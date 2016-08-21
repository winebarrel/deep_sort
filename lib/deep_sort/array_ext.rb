module DeepSort::ArrayExt
  def deep_sort!(options = {})
    new_array = self.deep_sort(options)
    self.replace(new_array)
  end

  def deep_sort(options)
    DeepSort::ArrayExt.deep_sort(self, options)
  end

  def self.deep_sort(array, options = {})
    array = array.map do |value|
      if value.is_a?(Array)
        DeepSort::ArrayExt.deep_sort(value, options)
      elsif value.is_a?(Hash)
        DeepSort::HashExt.deep_sort(value, options)
      elsif options[:sort_enum] and value.is_a?(Enumerable)
        DeepSort::ArrayExt.deep_sort(value.to_a, options)
      else
        value
      end
    end

    begin
      array.sort
    rescue
      array.sort_by(&:to_s)
    end
  end
end
