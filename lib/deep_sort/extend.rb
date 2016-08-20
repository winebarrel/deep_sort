require 'deep_sort/enum_ext'

class Array
  prepend DeepSort::ArrayExt
end

class Hash
  prepend DeepSort::HashExt
end
