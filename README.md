# CommandProcess
Swift "Process" class Wrapper.

# Usage
```swift
import CommandProcess

// Shell Version
do {
  let result = CommandProcess.executeShell(["-c", "sh --version"])
  print(CommandProcess.executeShell(["-c", "sh --version"]))
  // -> Result(outputMessage: "GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin18)\nCopyright (C) 2007 Free Software Foundation, Inc.\n", errorMessage: "")
}

// echo
do {
  let result = CommandProcess.executeShell(["-c", "echo '\("Hello World")'"])
  print(result)
  // -> Result(outputMessage: "Hello World\n", errorMessage: "")
}

// pwd
do { 
  let result = CommandProcess.executeShell(["-c", "pwd"])
  print(result)
  // -> Result(outputMessage: "/tmp\n", errorMessage: "")
}

// ls (non exist path)
do {
  let result = CommandProcess.executeShell(["-c", "ls /nonexist"])
  print(result)
  // -> Result(outputMessage: "", errorMessage: "ls: /nonexist: No such file or directory\n")
}

// Invalid command
do {
  let result = CommandProcess.executeShell(["-c", "invalidcommand"])
  print(result)
  // -> Result(outputMessage: "", errorMessage: "/bin/sh: invalidcommand: command not found\n")
}

// Permission error
do {
  let result = CommandProcess.executeShell(["-c", "purge"])
  print(result)
  // -> Result(outputMessage: "", errorMessage: "Unable to purge disk buffers: Operation not permitted\n")
}
```

    
