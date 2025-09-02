module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    result = []
    i = 0
    while i < self.length
      if yield(self[i])
        result << self[i]
      end
      i += 1
    end
    result
  end

  def my_all?
    i = 0
    while i < self.length
      return false unless yield(self[i])
      i += 1
    end
    true
  end

  def my_any?
    i = 0
    while i < self.length
      return true if yield(self[i])
      i += 1
    end
    false
  end

  def my_none?
    i = 0
    while i < self.length
      return false if yield(self[i])
      i += 1
    end
    true
  end

  def my_count(item = nil)
    count = 0
    i = 0
    while i < self.length
      if block_given?
        count += 1 if yield(self[i])
      elsif !item.nil?
        count += 1 if self[i] == item
      else
        count += 1
      end
      i += 1
    end
    count
  end

  def my_map(proc = nil)
    result = []
    i = 0
    while i < self.length
      if block_given?
        result << yield(self[i])
      elsif !proc.nil?
        result << proc.call(self[i])
      else
        result << self[i]
      end
      i += 1
    end
    result
  end

  def my_inject(initial = nil)
    acc = initial.nil? ? self[0] : initial
    i = initial.nil? ? 1 : 0

    while i < self.length
      acc = yield(acc, self[i])
      i += 1
    end
    acc
  end
end
