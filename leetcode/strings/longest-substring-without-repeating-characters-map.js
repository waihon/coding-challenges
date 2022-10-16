// https://leetcode.com/problems/longest-substring-without-repeating-characters/
// Given a string s, find the length of the longest substring without
// repeating characters.

/**
 * @param {string} s
 * @return {number}
 */
const lengthOfLongestSubstring = function(s) {
  if (s.length <= 1) return s.length;
  
  const seenChars = new Map;
  let left = 0; longest = 0;
  
  for (let right = 0; right < s.length; right++) {
    const currentChar = s[right];
    const prevSeenCharIdx = seenChars.get(currentChar);
    
    if (prevSeenCharIdx >= left) {
      left = prevSeenCharIdx + 1;
    }
    seenChars.set(currentChar, right);
    
    longest = Math.max(longest, right - left + 1);
  }
  
  return longest;
}

try {
  Error.stackTraceLimit = 1;
  if (!(lengthOfLongestSubstring("abccabb") === 3)) throw new Error("Test Result Error");
  if (!(lengthOfLongestSubstring("cccccc") === 1)) throw new Error("Test Result Error");
  if (!(lengthOfLongestSubstring("") === 0)) throw new Error("Test Result Error");
  if (!(lengthOfLongestSubstring("abcbda") === 4)) throw new Error("Test Result Error");
  if (!(lengthOfLongestSubstring("abcabcbb") === 3)) throw new Error("Test Result Error");
  if (!(lengthOfLongestSubstring("bbbbb") === 1)) throw new Error("Test Result Error");
  if (!(lengthOfLongestSubstring("pwwkew") === 3)) throw new Error("Test Result Error");
  console.log("All test cases passed!");
}
catch(err) {
  console.log(err.stack)
}