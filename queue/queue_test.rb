# typed: true

require 'minitest/autorun'
require_relative './queue'

class TestQueue < Minitest::Test
  def test_peek_returns_nil_when_empty
    q = Queue[Integer].new
    assert q.peek.nil?
  end

  def test_peek_returns_value_when_not_empty
    value = 1
    q = Queue[Integer].new(1)

    assert q.peek == value
  end

  def test_enqueue_adds_node_to_q
    q = Queue[Integer].new

    assert q.size == 0

    q.enqueue(0)
    assert q.size == 1

    q.enqueue(1)
    assert q.size == 2
    assert q.peek == 0
  end

  def test_dequeue_removes_element_from_q
    initial_value = 1
    q = Queue[Integer].new(initial_value)
    q.enqueue(0)

    assert_equal 2, q.size
    dequeued_value = q.dequeue

    assert_equal initial_value, dequeued_value
    assert q.size == 1
  end
end
