module Enumerable
  def deep_sort
    DeepSort::Array.deep_sort(self.to_a, sort_enum: true)
  end
end
