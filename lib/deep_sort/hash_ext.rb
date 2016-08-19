module DeepSort::HashExt
  def deep_sort!(options = {})
    new_hash = self.deep_sort(options)
    self.replace(new_hash)
  end

  def deep_sort(options = {})
    new_hash = {}

    self.keys.sort_by(&:to_s).each do |key|
      value = self[key]

      case value
      when Array, Hash
        value = value.deep_sort(options)
      when Enumerable
        if options[:sort_enum]
          value = value.to_a.deep_sort(options)
        end
      end

      new_hash[key] = value
    end

    new_hash
  end
end

class Hash
  prepend DeepSort::HashExt
end
