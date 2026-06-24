class Solution {
public:
    int calPoints(vector<string>& operations) {
        // Approach is to use a stack to keep track of the scores we record
        int previousScore = 0;
        int previousPreviousScore = 0;
        stack<int> record;
        for (int i = 0; i < operations.size(); i++) {
            try {
                int val = stoi(operations[i]);
                previousPreviousScore = previousScore;
                previousScore = val;
                record.push(val);
            } catch (invalid_argument& e) {
                // Indicates it's either C or +
                if (operations[i] == "C") {
                    record.pop();
                    // Need to reset previous scores tracking
                    if (record.empty()) {
                        previousScore = 0;
                    } else if (record.size() == 1) {
                        previousScore = previousPreviousScore;
                        previousPreviousScore = 0;
                    } else if (record.size() >= 2) {
                        previousScore = previousPreviousScore;
                        record.pop();
                        previousPreviousScore = record.top();
                        record.push(previousScore);
                    }
                } else if (operations[i] == "+") {
                    int newScore = previousScore + previousPreviousScore;
                    previousPreviousScore = previousScore;
                    previousScore = newScore;
                    record.push(newScore);
                } else if (operations[i] == "D") {
                    int newScore = previousScore*2;
                    previousPreviousScore = previousScore;
                    previousScore = newScore;
                    record.push(newScore);
                }
            }
        }
        int returnSum = 0;
        while(!record.empty()) {
            returnSum += record.top();
            record.pop();
        }
        return returnSum;
    }
};