# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end

  def each
    counter = 0

    while counter < @todos.size
      yield(self.item_at(counter))
      counter += 1
    end

    self

    # @todos.each do |todo|
    #   yield(todo)
    # end
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(todo_title)
    # select
    select {|todo| todo.title == todo_title}.first
  end

  def all_done
    #select
    select {|todo| todo.done?}
  end

  def all_not_done
    #select
    select {|todo| !todo.done?}
  end

  def mark_done(todo_title)
    each {|todo| todo.done! if todo.title == todo_title}
  end

  def mark_all_done
    each {|todo| todo.done!}
  end

  def mark_all_undone
    each {|todo| todo.undone!}
  end

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

#list.mark_done_at(0)

#puts list.find_by_title("Buy milk").inspect
list.mark_done("Buy milk")
p list.all_done
#puts list.done?
