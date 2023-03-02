#!/usr/bin/env bash
# From https://devhints.io/bash

echo "don't run this file"
return 1

name="John"
echo $name  # see below
echo "$name"
echo "${name}!"

name="John"
echo "Hi $name"  #=> Hi John
echo 'Hi $name'  #=> Hi $name

# Shell Execution
echo "I'm in $(pwd)"

# Conditional Execution
git commit && git push
git commit || echo "Commit failed"

# Functions
get_name() {
  echo "John"
}

echo "You are $(get_name)"

# Conditionals
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
fi

# Brace Expansion
echo {A,B} # Same as A B
echo {A,B}.js # Same as A.js B.js
echo {1..5} # Same as 1 2 3 4 5

# Parameter Expansions
name="John"
echo "${name}"
echo "${name/J/j}"    #=> "john" (substitution)
echo "${name:0:2}"    #=> "Jo" (slicing)
echo "${name::2}"     #=> "Jo" (slicing)
echo "${name::-1}"    #=> "Joh" (slicing)
echo "${name:(-1)}"   #=> "n" (slicing from right)
echo "${name:(-2):1}" #=> "h" (slicing from right)
echo "${food:-Cake}"  #=> $food or "Cake"
length=2
echo "${name:0:length}"  #=> "Jo"

str="/path/to/foo.cpp"
echo "${str%.cpp}"    # /path/to/foo
echo "${str%.cpp}.o"  # /path/to/foo.o
echo "${str%/*}"      # /path/to

echo "${str##*.}"     # cpp (extension)
echo "${str##*/}"     # foo.cpp (basepath)

echo "${str#*/}"      # path/to/foo.cpp
echo "${str##*/}"     # foo.cpp

echo "${str/foo/bar}" # /path/to/bar.cpp
str="Hello world"
echo "${str:6:5}"   # "world"
echo "${str: -5:5}"  # "world"
src="/path/to/foo.cpp"
base=${src##*/}   #=> "foo.cpp" (basepath)
dir=${src%$base}  #=> "/path/to/" (dirpath)

# Substitution
${foo%suffix}  #=>	Remove suffix
${foo#prefix}  #=>	Remove prefix
${foo%%suffix} #=>	Remove long suffix
${foo/%suffix} #=>	Remove long suffix
${foo##prefix} #=>	Remove long prefix
${foo/#prefix} #=>	Remove long prefix
${foo/from/to} #=>	Replace first match
${foo//from/to} #=>	Replace all
${foo/%from/to} #=>	Replace suffix
${foo/#from/to} #=>	Replace prefix

# Comments
# This is a single line comment
: '
This is a
multi line
comment
'

# Substrings
${foo:0:3}	  #=> Substring (position, length)
${foo:(-3):3}	#=> Substring from the right

# Length
${#foo} #=> Length of foo

# String Manipulation
str="HELLO WORLD!"
echo "${str,}"   #=> "hELLO WORLD!" (lowercase 1st letter)
echo "${str,,}"  #=> "hello world!" (all lowercase)

str="hello world!"
echo "${str^}"   #=> "Hello world!" (uppercase 1st letter)
echo "${str^^}"  #=> "HELLO WORLD!" (all uppercase)

# Default Values
${foo:-val} #=>	$foo, or val if unset (or null)
${foo:=val} #=>	Set $foo to val if unset (or null)
${foo:+val} #=>	val if $foo is set (and not null)
${foo:?message} #=>	Show error message and exit if $foo is unset (or null)
# Omitting the : removes the (non)nullity checks, e.g. ${foo-val} expands to val if unset otherwise $foo.

# Basic For Loop
for i in /etc/rc.*; do
  echo "$i"
done

# C-like For Loop
for ((i = 0 ; i < 100 ; i++)); do
  echo "$i"
done

# Ranges
for i in {1..5}; do
    echo "Welcome $i"
done

# Ranges with step size
for i in {5..50..5}; do
    echo "Welcome $i"
done

# Reading Lines
while read -r line; do
  echo "$line"
done <file.txt

# Loop Forever
while true; do
  ···
done

# Defining Functions
myfunc() {
    echo "hello $1"
}
# Same as above (alternate syntax)
function myfunc() {
    echo "hello $1"
}
myfunc "John"

# Returning values
myfunc() {
    local myresult='some value'
    echo "$myresult"
}
result=$(myfunc)

# Raising Errors
myfunc() {
  return 1
}
if myfunc; then
  echo "success"
else
  echo "failure"
fi

# Accessing Argument Data
$#	#=> Number of arguments
$*	#=> All positional arguments (as a single word)
$@	#=> All positional arguments (as separate strings)
$1	#=> First argument
$_	#=> Last argument of the previous command
# Note: $@ and $* must be quoted in order to perform as described. Otherwise, they do exactly the same thing (arguments as separate strings).

# Conditions
[[ -z STRING ]]	#=> Empty string
[[ -n STRING ]]	#=> Not empty string
[[ STRING == STRING ]]	#=> Equal
[[ STRING != STRING ]]	#=> Not Equal
[[ NUM -eq NUM ]]	#=> Equal
[[ NUM -ne NUM ]]	#=> Not equal
[[ NUM -lt NUM ]]	#=> Less than
[[ NUM -le NUM ]]	#=> Less than or equal
[[ NUM -gt NUM ]]	#=> Greater than
[[ NUM -ge NUM ]]	#=> Greater than or equal
[[ STRING =~ STRING ]]	#=> Regexp
(( NUM < NUM ))	#=> Numeric conditions
[[ -o noclobber ]]	#=> If OPTIONNAME is enabled
[[ ! EXPR ]]	#=> Not
[[ X && Y ]]	#=> And
[[ X || Y ]]	#=> Or

# File Conditions
[[ -e FILE ]]	#=> Exists
[[ -r FILE ]]	#=> Readable
[[ -h FILE ]]	#=> Symlink
[[ -d FILE ]]	#=> Directory
[[ -w FILE ]]	#=> Writable
[[ -s FILE ]]	#=> Size is > 0 bytes
[[ -f FILE ]]	#=> File
[[ -x FILE ]]	#=> Executable
[[ FILE1 -nt FILE2 ]]	#=> 1 is more recent than 2
[[ FILE1 -ot FILE2 ]]	#=> 2 is more recent than 1
[[ FILE1 -ef FILE2 ]]	#=> Same files

# Condition Examples
# String
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
else
  echo "This never happens"
fi
# Combinations
if [[ X && Y ]]; then
  ...
fi
# Equal
if [[ "$A" == "$B" ]]
# Regex
if [[ "A" =~ . ]]
if (( $a < $b )); then
   echo "$a is smaller than $b"
fi
if [[ -e "file.txt" ]]; then
  echo "file exists"
fi