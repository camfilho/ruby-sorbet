# typed: true

require 'sorbet-runtime'

class Node < T::Struct
  extend T::Generic # Provides `type_member` helper
  Elem = type_member # Makes the `Box` class generic

  prop :value, Elem
  prop :next, T.nilable(Node[Elem])
end

class Queue
  extend T::Sig
  extend T::Generic
  Elem = type_member

  private

  attr_accessor :head, :tail
  attr_writer :size

  public

  attr_reader :size

  sig { params(initial_value: T.nilable(Elem)).void }
  def initialize(initial_value = nil)
    @head = initial_value ? Node[Elem].new(value: initial_value) : nil
    @tail = initial_value ? Node[Elem].new(value: initial_value) : nil
    @size = initial_value ? 1 : 0
  end

  sig { params(value: Elem).void }
  def enqueue(value)
    self.size += 1
    node = Node[Elem].new(value: value)

    if head.nil?
      self.head = self.tail = node
      return
    end

    tail.next = node
    self.tail = node
  end

  sig { returns(T.nilable(Elem)) }
  def dequeue
    return nil if head.nil?

    self.size -= 1

    self.tail = nil if size == 0

    new_head = head
    self.head = head.next

    new_head.value
  end

  sig { returns(T.nilable(Elem)) }
  def peek = head&.value
end
