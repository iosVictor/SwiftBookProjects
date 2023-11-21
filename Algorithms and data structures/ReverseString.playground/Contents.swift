func reverseString(string: inout[Character]) {
    var last = string.count - 1
    var first: Int = 0
    while first < last {
        (string[first], string[last]) = (string[last], string[first])
        first += 1
        last -= 1
    }
}

var charArray: [Character] = ["G", "o", " ", "1", "2"]
reverseString(string: &charArray)
