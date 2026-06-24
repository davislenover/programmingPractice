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
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        // Approach is to use two pointers, one for each list
        // At every iteration, compare the values within the pointers
        // If pt1 <= ptr2, take value of pt1 and place in next spot on new linked list, increment pt1
        // if ptr2 < pt1, take value of pt2 instead and increment pt2
        // If pt1 = nullptr, then always take pt2
        // If pt2 = nullptr, always take pt1
        // If pt1,pt2 = nullptr, return the head of the new linked list
        ListNode* pt1 = list1;
        ListNode* pt2 = list2;
        if (!pt1 && !pt2) return nullptr;
        ListNode* newHead = new ListNode();
        ListNode* curNode = newHead;
        if (pt1 && pt2) {
            if (pt1->val <= pt2->val) {
                curNode->val = pt1->val;
                pt1 = pt1->next;
            } else {
                curNode->val = pt2->val;
                pt2 = pt2->next;
            }
        } else if (!pt1 && pt2) {
            curNode->val = pt2->val;
            pt2 = pt2->next;
        } else {
            curNode->val = pt1->val;
            pt1 = pt1->next;
        }
        while(pt1 || pt2) {
            ListNode* newNodeToAppend = new ListNode();
            if (!pt1 && pt2) {
                newNodeToAppend->val = pt2->val;
                pt2 = pt2->next;
                curNode->next = newNodeToAppend;
            } else if (!pt2 && pt1) {
                newNodeToAppend->val = pt1->val;
                pt1 = pt1->next;
                curNode->next = newNodeToAppend;
            } else if (pt1->val <= pt2->val) {
                newNodeToAppend->val = pt1->val;
                pt1 = pt1->next;
                curNode->next = newNodeToAppend;
            } else {
                newNodeToAppend->val = pt2->val;
                pt2 = pt2->next;
                curNode->next = newNodeToAppend;
            }
            curNode = newNodeToAppend;
        }
        return newHead;
    }
};
