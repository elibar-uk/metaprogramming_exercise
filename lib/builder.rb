# imported to handle any plural/singular conversions
require 'active_support/core_ext/string'
require "pry"
class Builder

attr_reader :name

  def initialize(name)
    @name = name
    @woman = false
  end

  def is_a
    @woman = true
    self
  end

  def woman?
    @woman
  end

  def is_not_a
    self
  end

  def method_missing(name, *args, &block)
    create_instance_eval(self.class, name) do
      instance_variable_set("@#{name}", false)
    end
  end

  def create_instance_eval(klass, method, &block)
    klass.class_eval { define_method(method, &block) }
  end

  def respond_to_missing(method_name, include_private = false)
    true
  end

end
