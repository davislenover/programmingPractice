class Solution {
public:
    bool isValid(string s) {
        /* 
        Approach for this is to use a stack
         Every time a {,( or [ is seen, push onto the stack
         Everytime the opposite is seen, check if the top of the stack-
         contains the corresponding character
         This solution results in a time complexity of O(n) where n-
         is the number of characters in the string, spatial complexity is O(n) too
        */
        stack<char> check;
        for (int i = 0; i < s.size(); i++) {
            char curVal = s.at(i);
            if (curVal == '(' || curVal == '{' || curVal == '[') {
                check.push(curVal);
            } else {
                if (!check.empty()) {
                    if (curVal == ')' && check.top() == '(' || curVal == '}' && check.top() == '{' || curVal == ']' && check.top() == '[') {
                        check.pop();
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }
        return check.empty();
    }
};
