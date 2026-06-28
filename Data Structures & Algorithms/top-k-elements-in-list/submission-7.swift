class Solution {
    /*
        Need to frequency count the elements.
        We can use bucket sort to create n buckets where n equals the frequency n of each number
        To do this, we will also need a hashmap to keep track of the frequencies
        After counting, we can then print out elements of the bucket array starting from n downwards
        Check of the bucket doesn't contain a value of 1001 (which nums[i] is bounded to max 1000)
        n elements means n steps to check frequencies, n steps to sort thus O(n) time complexity/spatial
    */
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqCount : [Int:Int] = [:];
        var topNBuckets : [[Int]] = Array(repeating:Array<Int>(),count:nums.count+1);
        for (_,element) in nums.enumerated() {
            guard let curVal: Int = freqCount[element] else {
                freqCount[element] = 1;
                continue;
            }
            freqCount[element]! = curVal + 1;
        }
        // Iterate through keys
        for (key,value) in freqCount {
            topNBuckets[value].append(key);
        }
        // Pick top k elements
        var curKLeft : Int = k;
        var returnArr : [Int] = [];
        for idx in stride(from:topNBuckets.count-1,through:0,by:-1) {
            if (curKLeft <= 0) {break;}
            if (curKLeft > 0 && topNBuckets[idx].count != 0) {
                for (_,element) in topNBuckets[idx].enumerated() {
                    returnArr.append(element);
                    curKLeft -= 1;
                }
            }
        }
        return returnArr;
    }
}
