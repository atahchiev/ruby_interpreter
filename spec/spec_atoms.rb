require "spec_helper"

class TestAtoms < Test::Unit::TestCase
  def test_integer
    assert_equal(Lisputin::Parser.parse('2').to_sexp, [[:integer, 2]] )
    assert_equal(Lisputin::Parser.parse('-2').to_sexp, [[:integer, -2]] )
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
end