component extends="mxunit.framework.TestCase" {


    function test_repeat_givenXand1_expectX() {
        assertEquals("X", repeat("X", 1));
    }


    function test_repeat_givenXand2_expectXX() {
        assertEquals("XX", repeat("X", 2));
    }


    function test_repeat_givenIand3_expectIII() {
        assertEquals("III", repeat("I", 3));
    }


    private string function repeat(char, count) {
        var result = '';
        for (var i=1; i lte count; i++) {
            result &= char;
        }
        return result;
    }
    

    function test_numberToNumeral_given1_expectI() {
        assertEquals("I", numberToNumeral(1));
    }
    

    function test_numberToNumeral_given2_expectII() {
        assertEquals("II", numberToNumeral(2));
    }


    function test_numberToNumeral_given4_expectIV() {
        debug(4 % 5);
        assertEquals("IV", numberToNumeral(4));
    }
    

    function test_numberToNumeral_given5_expectV() {
        assertEquals("V", numberToNumeral(5));
    }


    function test_numberToNumeral_given7_expectVII() {
        assertEquals("VII", numberToNumeral(7));
    }


    function test_numberToNumeral_given9_expectIX() {
        assertEquals("IX", numberToNumeral(9));
    }


    function test_numberToNumeral_given14_expectXIV() {
        assertEquals("XIV", numberToNumeral(14));
    }


    function test_numberToNumeral_given49_expectXLIX() {
        assertEquals("XLIX", numberToNumeral(49));
    }


    function test_numberToNumeral_given87_expectLXXXVII() {
        assertEquals("LXXXVII", numberToNumeral(87));
    }


    function test_numberToNumeral_given190_expectCXC() {
        assertEquals("CXC", numberToNumeral(190));
    }


    function test_numberToNumeral_given573_expectDLXXIII() {
        assertEquals("DLXXIII", numberToNumeral(573));
    }


    private string function numberToNumeral(required numeric number) {
        var columns = [["M", 1000], ["C", 100], ["X", 10], ["I", 1]];
        var numeral = "";

        for(var column in columns) {
            if(number gte column[2]) {
                numeral &= columnToNumeral(int(number/column[2]), column[1]);
                number = number % column[2];
            }
        }

        return numeral;
    }


    function test_columnToNumeral_given4andX_expectXL() {
        assertEquals("XL", columnToNumeral(4, "X"))
    }


    function test_columnToNumeral_given5andX_expectL() {
        assertEquals("L", columnToNumeral(5, "X"))
    }


    function test_columnToNumeral_given2andC_expectL() {
        assertEquals("CC", columnToNumeral(2, "C"))
    }


    private string function columnToNumeral(number, column) {
        var numerals = "IVXLCDM";
        var result   = "";

        if (number eq 4 or number eq 9)
            result &= column;
        if (number gte 4 and number lt 9)
            result &= mid(numerals, find(column, numerals) + 1, 1);
        if (number eq 9)
            result &= mid(numerals, find(column, numerals) + 2, 1);
        if (number gt 5 and number lt 9)
            result &= repeat(column, number % 5);
        if (number lte 3)
            result &= repeat(column, number);

        return result;
    }


}