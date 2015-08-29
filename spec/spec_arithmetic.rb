# require_relative "./parser.rb"
require "test/unit"
require "../lib/lisputin/parser"
# require_relative "spec_arithmetic"
# p Lisputin::Parser.parse('2').to_sexp

class TestArithmetic < Test::Unit::TestCase
  def test_add
    assert_equal(Lisputin::Parser.parse('(+ 3 2)').to_sexp, [[[:op, :+], [[:integer, 3], [:integer, 2]]]] )
    assert_equal(Lisputin::Parser.parse('(+ 3 (+ 3 2))').to_sexp,  [[[:op, :+], [[:integer, 3], [[:op, :+], [[:integer, 3], [:integer, 2]]]]]])
    assert_equal(Lisputin::Parser.parse('(* 3 (+ 3 2 + 3i))').to_sexp,  [[[:op, :*], [[:integer, 3], [[:op, :+], [[:integer, 3], [:complex, [:integer, 2], [:integer, 3]]]]]]])
  end

  def test_float
    assert_equal(Lisputin::Parser.parse('2.5').to_sexp, [[:float, 2.5]] )
    assert_equal(Lisputin::Parser.parse('-2.3').to_sexp, [[:float, -2.3]] )
  end

  def test_rat
    assert_equal(Lisputin::Parser.parse('2/10').to_sexp, [[:rat, 2, 10]] )
    assert_equal(Lisputin::Parser.parse('-3/4').to_sexp, [[:rat, -3, 4]] )
  end


  def test_complex
    assert_equal(Lisputin::Parser.parse('3 + 4i').to_sexp, [[:complex, [:integer, 3], [:integer, 4]]] )
    assert_equal(Lisputin::Parser.parse('-2+3i').to_sexp, [[:complex, [:integer, -2], [:integer, 3]]] )
  end
    #   assert_equal(Lisputin::Parser.parse('2.4').to_sexp, [[:integer, 2]] )
    # assert_equal(Lisputin::Parser.parse('2/10').to_sexp, [[:rat, "2", "10"]] )
    # assert_equal(Lisputin::Parser.parse('2').to_sexp, [[:integer, 2]] )


end
