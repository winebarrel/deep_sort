module DeepSort::Hash
  def deep_sort!(options = {})
    new_hash = self.deep_sort(options)
    self.replace(new_hash)
  end

  def deep_sort(options = {})
    DeepSort::Hash.deep_sort(self, options)
  end

  def self.deep_sort(hash, options = {})
    new_hash = {}

    hash.keys.sort_by(&:to_s).each do |key|
      value = hash[key]

      case value
      when Array, Hash
        value = DeepSort.deep_sort(value, options)
      when Enumerable
        if options[:sort_enum]
          value = DeepSort.deep_sort(value.to_a, options)
        end
      end

      new_hash[key] = value
    end

    new_hash
  end
end
