/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */

class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        // Iterate over every node and keep track of previous node
        // At each node, set next pointer to previous node
        // Runtime complexity is O(n), spatial is O(1)
        ListNode* curNode = head;
        ListNode* prevNode = nullptr;
        while(curNode) {
            ListNode* nextNode = curNode->next; // Get next node
            curNode->next = prevNode; // Set current node ptr to previous node
            prevNode = curNode; // Set previous node for next node
            curNode = nextNode; // Move to next node
        }
        return prevNode;
    }
};
