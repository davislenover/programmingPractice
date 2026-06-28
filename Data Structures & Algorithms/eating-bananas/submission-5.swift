class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // Binary search k, where the upper bound for k is the maximum size for all the piles
        // Thus sort the piles (n*log n time)
        var pilesCpy : [Int] = piles;
        pilesCpy.sort();
        var right : Int = pilesCpy[pilesCpy.count-1];
        var left : Int = 1;
        var lastKWorked : Int = Int.max;
        while(left <= right) {
            let midPoint : Int = (right+left)/2;
            let numHours : Int = Self.simulate(pilesCpy,midPoint);
            if (numHours > h) {
                // k is too low, check bigger
                left = midPoint + 1;
            } else if (numHours <= h) {
                // k works but can we go lower?
                right = midPoint - 1;
                if (lastKWorked > midPoint) {
                    lastKWorked = midPoint;
                }
            }
        }
        return lastKWorked;
    }

    // Function to determine how long it takes to eat all piles at a rate of k banana's per hour
    // O(n) time
    private static func simulate(_ piles : [Int], _ k : Int) -> Int {
        var totalHours : Int = 0;
        for (_,element) in piles.enumerated() {
            totalHours += (element + k - 1)/k; // celling divison in swift
        }
        return totalHours;
    }
}
