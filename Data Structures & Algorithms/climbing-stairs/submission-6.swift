class Solution {
    // Given we are on the nth step...how many way could we have gotten there?
    // The number of ways to the previous step + number of ways to the step before the previous step
    func climbStairs(_ n: Int) -> Int {
        // climbStairs(n) = climbStairs(n-1) + climbStairs(n-2)
        // climbStairs(0) = 1
        // climbStairs(1) = 1
        var dp : [Int] = Array(repeating: -1, count: n+1);
        dp[0] = 1;
        dp[1] = 1;
        return populateTable(&dp,n);
    }

    func populateTable(_ table: inout [Int], _ curStep : Int) -> Int {
        if (curStep < 0) {
            return 0;
        } else if (table[curStep] == -1) {
            table[curStep] = populateTable(&table,curStep-1) + populateTable(&table,curStep-2);
        }
        return table[curStep];
    }


}
