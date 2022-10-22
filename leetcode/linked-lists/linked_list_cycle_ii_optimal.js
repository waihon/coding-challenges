// https://leetcode.com/problems/linked-list-cycle-ii
// Given the head of a linked list, return the node where the cycle begins.
// If there is no cycle, return null.

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
const detectCycle = function(head) {
  if (head === null) {
    return null;
  }
  
  let tortoise = head, hare = head;
  
  while (hare && hare.next) {
    tortoise = tortoise.next;  // tortoise moves 1 step
    hare = hare.next.next; // hair moves 2 steps
 
    if (tortoise === hare) { // found a meeting point, i.e. cycle detected
      let p1 = head;
      let p2 = tortoise;
      while (p1 !== p2) {
        p1 = p1.next;
        p2 = p2.next;
      }
      return p1;
    }
  }

  return null;
};
