require 'test/unit'
require 'parser'

class TestParser < Test::Unit::TestCase

    def test_line_void
        parser = Parser.new([])
        expected = parser.parse("")
        assert_equal expected, []
    end
    
    
    def test_line_spaces
        parser = Parser.new([])
        expected = parser.parse("     ")
        assert_equal expected, []
    end

    def test_line_string
        parser = Parser.new([:s])
        assert_equal [ "4p" ], parser.parse("4p")
    end

    def test_line_integer
        parser = Parser.new([:i])
        assert_equal [ 4 ], parser.parse("4")
    end

    def test_line_float
        parser = Parser.new([:f])
        assert_equal [ 4.2 ], parser.parse("4.2")
    end

    def test_line_variated
        parser = Parser.new([:f, :i, :s, :i, :f, :f])
        assert_equal([ 4.2, 123, "Slavoj_Zi:Zek", 88, 2.78901234, 8],
                     parser.parse("4.2 123   Slavoj_Zi:Zek 88 2.78901234 8"))
    end
    
end
