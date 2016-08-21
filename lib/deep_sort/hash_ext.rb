module DeepSort::HashExt
  def deep_sort!(options = {})
    new_hash = self.deep_sort(options)
    self.replace(new_hash)
  end

  def deep_sort(options = {})
    DeepSort::HashExt.deep_sort(self, options)
  end

  def self.deep_sort(hash, options = {})
    new_hash = {}
    keys = hash.keys

    begin
      keys = keys.sort
    rescue
      keys = keys.sort_by(&:to_s)
    end

    keys.each do |key|
      value = hash[key]

      if value.is_a?(Array)
        value = DeepSort::ArrayExt.deep_sort(value, options)
      elsif value.is_a?(Hash)
        value = DeepSort::HashExt.deep_sort(value, options)
      elsif options[:sort_enum] and value.is_a?(Enumerable)
        value = DeepSort::ArrayExt.deep_sort(value.to_a, options)
      end

      new_hash[key] = value
    end

    new_hash
  end
end
