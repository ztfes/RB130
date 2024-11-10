require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.to_a.size)
  end

  def test_first
    assert_equal(@todos.first, @list.to_a.first)
  end

  def test_last
    assert_equal(@todos.last, @list.to_a.last)
  end

  def test_shift
    assert_equal(@todos.shift, @list.to_a.shift)
  end

  def test_pop
    assert_equal(@todos.pop, @list.to_a.pop)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Walk the dog")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.done!
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal(@todo1, @list.remove_at(0))
    # @list.remove_at(1)
    # assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_multiline_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_multiline_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iterate
    # @todos.each do |todo|
    #   yield(todo)
    # end

    # @list.each {|todo| todo.done!}
    # assert_equal(true, @list.done?)

    output = []
    @list.each {|todo| output << todo}
    assert_equal(@list.to_a, output)
  end

  def test_each_return
    output = @list.each {|todo| todo}
    assert_equal(@list, output)
  end

  def test_select
    @list.mark_done_at(1)
    output = @list.select {|todo| todo.done?}.to_a[0]
    assert_equal(@todo2, output)
  end

  def test_find_by_title
    selected = @list.select {|todo| todo.title == "Buy milk"}.first.title
    assert_equal("Buy milk", selected)
  end

  def test_all_done
    @list.mark_done_at(0)
    @list.mark_done_at(2)
    selected = @list.select {|todo| todo.done?}.to_a
    assert_equal([@todo1,@todo3], selected)
  end

  def test_all_not_done
    @list.mark_done_at(1)
    selected = @list.select {|todo| !todo.done?}.to_a
    assert_equal([@todo1, @todo3], selected)
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal([true,true,true], [@todo1.done?, @todo2.done?, @todo3.done?])
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal([false,false,false], [@todo1.done?, @todo2.done?, @todo3.done?])
  end
end
