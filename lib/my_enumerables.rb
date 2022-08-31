module Enumerable

  def my_each_with_index
    i = 0
    while i < length
      yield [self[i], i]
      i += 1
    end
    self
  end

  def my_select
    results = []
    my_each { |elem| results.push(elem) if yield elem }
    results
  end

  def my_all?
    condition_met = true
    my_each do |elem|
      condition_met = false unless yield elem
    end
    condition_met
  end

  def my_any?
    condition_met = false
    my_each do |elem|
      condition_met = true if yield elem
    end
    condition_met
  end

  def my_none?
    condition_met = true
    my_each do |elem|
      condition_met = false if yield elem
    end
    condition_met
  end

  def my_count
    count = 0
    if block_given?
      my_each do |elem|
        count += 1 if yield elem
      end
    else
      count = length
    end
    count
  end

  def my_map
    result = []
    my_each { |val| result.push(yield val) }
    result
  end

  def my_inject(result = 0)
    my_each { |val| result = yield [result, val] }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end
end
