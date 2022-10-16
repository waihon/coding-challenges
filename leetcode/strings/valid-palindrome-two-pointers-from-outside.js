// 2 pointers from the outside moving towards the center
const isValidPalindromeOutside = function(s) {
  s = s.replace(/[^A-Za-z0-9]/g, "").toLowerCase();

  // Initialize left/right pointers at start and end of string
  // respectively.
  let left = 0, right = s.length - 1;

  // Loop through string characters while comparing them, then
  // move the pointers closer to the center.
  // If the string is odd , the left/right pointers will end
  // at the index immediate to the left and right of the center.
  // There's no need to compare the center character.
  // If the string is even, the left/right pointers will end
  // at the 2 center characters respectively, and we'll need to
  // compare them.
  while (left < right) {
    if (s[left] !== s[right]) {
      return false;
    }
    left++;
    right--;
  }

  return true;
}

try {
  Error.stackTraceLimit = 1;
  if (!(isValidPalindromeOutside("aabaa") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeOutside("aabbaa") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeOutside("abc") === false)) throw new Error("Test Result Error");
  if (!(isValidPalindromeOutside("a") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeOutside("") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeOutside("A man, a plan, a canal: Panama") === true)) throw new Error("Test Result Error");
  console.log("All test cases passed!");
}
catch(err) {
  console.log(err.stack)
}
