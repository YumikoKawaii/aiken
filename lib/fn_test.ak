use aiken/primitive/bytearray.{at, length}

fn check_palindrome(input_string: ByteArray) -> Bool {
  rec_pal(input_string, 0, length(input_string) - 1)
}

fn rec_pal(input_string: ByteArray, first: Int, last: Int) -> Bool {
  when first >= last is {
    True -> True
    False ->
      when at(input_string, first) == at(input_string, last) is {
        True -> rec_pal(input_string, first + 1, last - 1)
        False -> False
      }
  }
}

fn shapeArea(n: Int) -> Int {
  2*n*n - 2*n + 1
}

test check_palindrome_1() {
  check_palindrome("123321") == True
}

test shapeArea_1() {
  shapeArea(4) == 25
}