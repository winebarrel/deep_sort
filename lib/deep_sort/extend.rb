require 'deep_sort/enum_ext'

class Array
  prepend DeepSort::Array
end

class Hash
  prepend DeepSort::Hash
end
