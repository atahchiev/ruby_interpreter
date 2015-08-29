

# require_relative "./parser.rb"
require "test/unit"
require "../lib/lisputin/parser"
# require_relative "spec_arithmetic"
# p Lisputin::Parser.parse('2').to_sexp

class TestAtoms < Test::Unit::TestCase
  def test_function
    assert_equal(Lisputin::Parser.parse('(define cat (a b c) (+ a b c))').to_sexp, [[[:func, :cat], [:args, [:a, :b, :c]], [[:op, :+], [[:symbol, :a], [:symbol, :b], [:symbol, :c]]]]] )
    assert_equal(Lisputin::Parser.parse('(define dog () ())').to_sexp, [[[:func, :dog], [:args, []], [:args, []]]] )
  end

    #   assert_equal(Lisputin::Parser.parse('2.4').to_sexp, [[:integer, 2]] )
    # assert_equal(Lisputin::Parser.parse('2/10').to_sexp, [[:rat, "2", "10"]] )
    # assert_equal(Lisputin::Parser.parse('2').to_sexp, [[:integer, 2]] )


end