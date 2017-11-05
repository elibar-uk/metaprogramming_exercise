# imported to handle any plural/singular conversions
require 'active_support/core_ext/string'
require "pry"
class Builder

attr_reader :name

  def initialize(name)
    @name = name
    @status = nil
  end

  def is_a
    @status = true
    self
  end

  def is_not_a
    @status = false
    self
  end

  def method_missing(method_name, *args, &block)
    return false if @status == nil
    if method_name[-1] == '?' && instance_variable_defined?("@#{method_name[0..-2]}")
      instance_variable_get("@#{method_name[0..-2]}")
    elsif method_name[-1] != '?'
      instance_variable_set("@#{method_name}", @status)
    end
  end

end
