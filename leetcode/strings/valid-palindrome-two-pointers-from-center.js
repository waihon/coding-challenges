// 2 pointers from the center moving outwards
const isValidPalindromeCenter = function(s) {
  s = s.replace(/[^A-Za-z0-9]/g, "").toLowerCase();

  // Initialize left/right pointers to point at the middle index
  // of the string. Indexes start at 0 meaning that we have to
  // floor() the value from dividing length by 2 in order to get
  // the index of the center.
  let left = Math.floor(s.length / 2), right = left;

  // If the string is even, more left pointer back by 1 so left/right
  // are pointing at the 2 middle values respectively.
  if (s.length % 2 === 0) {
    left--;
  } 

  // Loop throught the string wile expanding pointers outwards
  // comparing the characters.
  while (left >= 0 && right < s.length) {
    if (s[left] !== s[right]) {
      return false;
    }
    left--;
    right++;
  }

  return true;
}

try {
  Error.stackTraceLimit = 1;
  if (!(isValidPalindromeCenter("aabaa") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("aabbaa") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("abc") === false)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("a") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter(" ") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("A man, a plan, a canal: Panama") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("race a car") === false)) throw new Error("Test Result Error");
  if (!(isValidPalindromeCenter("race car") === true)) throw new Error("Test Result Error");
  console.log("All test cases passed!");
}
catch(err) {
  console.log(err.stack)
}
