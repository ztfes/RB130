=begin

PROBLEM

  input:
  output:

RULES/HINTS

  The second argument for the Element constructor is optional. Use some sort of default value when the argument is omitted that can't possibly be seen as a valid next element.

  The method used to create an array from a linked list should not mutate the linked list used to call it.

  The method used to reverse a linked list should not mutate the linked list used to call it. Instead, it should return a new linked list.


  We'll be making a singly linked list. This means that each element in the list does not need to have information about any other element in the list except for the next element.

  Each element in the list contains data (a value) and a next field that points to the next element in the list of elements.

  The elements of our linked list may contain any data values.

  We'll need a method that reverses a linked list, as well as methods that convert a linked list to and from an array.
  
  We may need to also write several helper methods.


=end

class Element
  attr_accessor :datum
  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def head
    # element?
  end

  def push
  end

  def datum
  end

  def size
  end

  def peak
  end

end