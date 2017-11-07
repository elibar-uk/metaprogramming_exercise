# metaprogramming_exercise

# can define boolean methods on an instance
jane.is_a.person
jane.is_a.woman
jane.is_not_a.man

jane.person? # => true
jane.man? # => false

# can define properties on a per instance level
jane.is_the.parent_of.joe
jane.parent_of # => 'joe'

# can define number of child things
# when more than 1, an array is created
jane.has(2).legs
jane.legs.size # => 2
jane.legs.first.is_a?(Thing) # => true

# can define single items
jane.has(1).head

jane.head.is_a?(Thing) # => true

# can define number of things in a chainable and natural format
jane.has(2).arms.each { having(1).hand.having(5).fingers }

jane.arms.first.hand.fingers.size # => 5

# can define properties on nested items
jane.has(1).head.having(2).eyes.each { being_the.color.blue.with(1).pupil.being_the.color.black }

# can define methods
jane.can.speak('spoke') do |phrase|
  "#{name} says: #{phrase}"
end

jane.speak("hello") # => "Jane says: hello"

# if past tense was provided then method calls are tracked
jane.spoke # => ["Jane says: hello"]
