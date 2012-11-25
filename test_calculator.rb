require 'test/unit'
require 'calculator'

class TestCalculator  < Test::Unit::TestCase
    
    def test_time
        calc = Calculator.new [:t]
        calc.in [48]
        assert_equal [48], calc.out
    end

    def test_integer_absolute
        calc = Calculator.new [:t, :a]
        calc.in [48,18]
        assert_equal [48,18], calc.out
    end

    def test_values_absolute
        calc = Calculator.new [:t, :a, :a, :a]
        calc.in [32, "pepe", 23, 32.3]
        assert_equal [32, "pepe", 23, 32.3], calc.out
    end 

    def test_several_values_absolute
        calc = Calculator.new [:t, :a, :a, :a]
        calc.in [32, "pepe", 23, 32.3]
        assert_equal [32, "pepe", 23, 32.3], calc.out
        calc.in [42, "pepeX", 231, 332.33]
        assert_equal [42, "pepeX", 231, 332.33], calc.out
    end 

    def test_several_values_relative
        calc = Calculator.new [:t, :a, :d, :d]
        calc.in [42, "pepe", 23, 32.3]
        calc.in [52, "pepeX", 231, 332.33]
        assert_equal [52, "pepeX", 208, 300.03], calc.out
    end

    def test_several_values_relative_twice
        calc = Calculator.new [:t, :a, :d, :d]
        calc.in [42, "pepe", 23, 32.3]
        calc.in [52, "pepeX", 231, 332.43]
        assert_equal [52, "pepeX", 208, 300.13], calc.out
        calc.in [62, "pepeY", 241, 338.43]
        assert_equal [62, "pepeY", 10, 6.0], calc.out
    end



end
