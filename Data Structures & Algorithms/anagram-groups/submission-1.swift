class Solution {
    /*
        Use a hashmap, where the keys are frequency counts of a given string and the value is the index-
        associated with that string
        This means for every new string I look at, perform the frequency count, check if that is an associated key
        If it is, find the assoicated index in the return 2D array, append it
        If the key is not found, then make it a key, place in a new array within the 2D array and store it's 2D array position in the hashmap
        Need an efficent way of making the frequency counts keys...which would be an array
        We can initalize a 26 element array (number of lowercase english alphabet letters)
        Swift arrays are hashable and their value depends on the contents within the array
        So the time complexity would be...n elements * m characters to frequency count
        Thus, if m is the longest string, we would be bounded by it thus O(n*m)
        Spatial complexity would be O(n) (because hashmap storage)
    */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var returnArr : [[String]] = [];
        var freqDict : [[Int]:Int] = [:];
        let zeroCharIdx : UInt8 = Character("a").asciiValue!;
        for (_,element) in strs.enumerated() {
            var freqArr : [Int] = Array(repeating:0,count:26);
            for char in element {
                freqArr[Int(char.asciiValue! - zeroCharIdx)] += 1;
            }
            guard let anagramGroupIdx : Int = freqDict[freqArr] else {
                // Add it to the hashmap along with the 2D in a new inner array
                // Store inner array position in outer array index value in hashmap
                returnArr.append([element]);
                freqDict[freqArr] = returnArr.count-1;
                continue;
            }
            // Store with anagramGroupIdx
            returnArr[anagramGroupIdx].append(element);
        }
        return returnArr;
    }
}
