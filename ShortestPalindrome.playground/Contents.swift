//: Playground - noun: a place where people can play

import UIKit

/*******************************************************
// MARK: - Version 1 - Keep going from interview
*******************************************************/

func buildPalimdrome(st: String) -> String {
  // fast check edge cases
  if st.characters.count == 0 { return "" }
  if st.characters.count == 1 { return st }
  if isPalindrome(st) { return st }
  
  let len = st.characters.count
  let isEven = len % 2 == 0
  var extra = 0
  
  // case not palimdrome yet
  for i in (1 ..< len) {
    if isPalindrome(String(Array(st.characters)[i ..< len])) {
      extra = i
      break
    }
  }
  
  return st + String(Array(st.characters)[0 ..< extra].reversed())
}

func isPalindrome(_ str: String) -> Bool {
  let len = str.characters.count
  let isEven = len % 2 == 0
  let middle = Int(floor(Double(len) / 2.0))
  let secondBegin = isEven ? middle : middle + 1
  let firstHalf = String(Array(str.characters)[0 ..< middle])
  let secondHalf = String(Array(str.characters)[secondBegin ..< len])
  
  return firstHalf == String(secondHalf.characters.reversed())
}

/*******************************************************
// MARK: - Test
*******************************************************/
 
buildPalimdrome(st: "")
buildPalimdrome(st: "a")
buildPalimdrome(st: "abba")
buildPalimdrome(st: "abc")
buildPalimdrome(st: "abcdc")
