class Solution {
    /*
        Approach is to use two pointers, one at the end and one at the start of the string
        Check if at the current position of both pointers the Characters are equal, if they arn't return false
        If they are, increase left pointer by one, decrease right pointer by one
        Keep doing this until either false occurs or both pointers reach the center to which return true
        O(n) time and O(1) spatial
    */
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s); // Want to use array was indexing a string is O(k) time
        var leftPtr : Int = 0;
        var rightPtr : Int = s.count-1;
        while (leftPtr < rightPtr) {
            while leftPtr < rightPtr && !Self.isAlphaNum(chars[leftPtr]) {
                leftPtr += 1;
            }
            while rightPtr > leftPtr && !Self.isAlphaNum(chars[rightPtr]) {
                rightPtr -= 1;
            }
            if (chars[leftPtr].lowercased() != chars[rightPtr].lowercased()) {
                return false;
            }
            leftPtr += 1;
            rightPtr -= 1;
        }
        return true;
    }
    private static func isAlphaNum(_ c : Character) -> Bool {
        return c.isLetter || c.isNumber;
    }
}
