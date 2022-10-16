// Compare against reverse
const isValidPalindromeReverse = function(s) {
  s = s.replace(/[^A-Za-z0-9]/g, "").toLowerCase();
  let rev = "";

  // Generate a reverse string using a reverse for loop.
  for (let i = s.length - 1; i >= 0; i--) {
    rev += s[i];
  }

  return s === rev;
}

try {
  Error.stackTraceLimit = 1;
  if (!(isValidPalindromeReverse("aabaa") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("aabbaa") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("abc") === false)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("a") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse(" ") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("A man, a plan, a canal: Panama") === true)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("race a car") === false)) throw new Error("Test Result Error");
  if (!(isValidPalindromeReverse("race car") === true)) throw new Error("Test Result Error");
  console.log("All test cases passed!");
}
catch(err) {
  console.log(err.stack)
}
