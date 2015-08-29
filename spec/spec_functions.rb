require "spec_helper"

class TestAtoms < Test::Unit::TestCase
  def test_function
    assert_equal(Lisputin::Parser.parse('(define cat (a b c) (+ a b c))').to_sexp, [[[:func, :cat], [:args, [:a, :b, :c]], [[:op, :+], [[:symbol, :a], [:symbol, :b], [:symbol, :c]]]]] )
    assert_equal(Lisputin::Parser.parse('(define dog () ())').to_sexp, [[[:func, :dog], [:args, []], [:args, []]]] )
  end
end