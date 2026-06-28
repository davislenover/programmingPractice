class Solution {
    /*
        Much like how binary is encoded over a transmission line/channel-
        There exists a preamble at the start which...using a fixed length of bits denotes how long
        the payload is...here our payload can be at maximum 199 characters, thus-
        before the beginning of each string, use 3 characters to denote it's length
        Decode will read these 3 characters, then read however many characters it found the length to be
        Given n strings...encode is O(n), decode is O(n) time complexity
    */
    func encode(_ strs: [String]) -> String {
        var encoded : String = "";
        for curStr in strs {
            var length : String = String(curStr.count);
            // May need to pad zero's at the front if curStr.count is two or one digit
            var numDigits : Int = 0;
            for _ in length {
                numDigits += 1;
            }
            if (numDigits == 1) {
                length = "00" + length; 
            } else if (numDigits == 2) {
                length = "0" + length;
            }
            // Now encode the string
            encoded.append(length+curStr);
        }
        return encoded;
    }

    func decode(_ str: String) -> [String] {
        var decodedString : [String] = [];
        var curIdx : String.Index = str.startIndex;
        while curIdx < str.endIndex {
            // Get length
            let lengthEndIdx = str.index(curIdx, offsetBy: 3);
            let lengthStr : Int = Int(str[curIdx..<lengthEndIdx])!; // Don't reach lengthEndIdx...just before it
            curIdx = lengthEndIdx; // now pointing at first character
            // Read string
            let stringStartIdx : String.Index = curIdx;
            let stringEndIdx : String.Index = str.index(stringStartIdx, offsetBy: lengthStr);
            let newStr : String = String(str[stringStartIdx..<stringEndIdx]);
            decodedString.append(newStr);
            curIdx = stringEndIdx;
        }
        return decodedString;
    }
}
