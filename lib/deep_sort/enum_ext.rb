module Enumerable
  def deep_sort
    DeepSort::ArrayExt.deep_sort(self.to_a, sort_enum: true)
  end
end
