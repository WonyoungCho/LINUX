# Introduction

## Install Haskell on CentOS

```
$ yum install -y epel-release
$ yum install -y haskell-platform
$ yum install -y emacs-haskell-mode
$ emacs ~/.emacs
(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))
```

## Compile & Execution
```
$ ghc --make hello.hs
$ ./hello
```
