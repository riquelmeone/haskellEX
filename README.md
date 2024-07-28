## leetcodeEX

### HOW TO USE

  stack build
  stack exec leetcodeEX-exe
#### or alternatively
  stack build > /dev/null 2>&1 && stack exec leetcodeEX-exe

### GIT SETUP
  git init
  git commit -m "...."
  git remote add origin https://github.com/riquelmeone/haskellEX
  git config --global credential.helper store
  git push -u origin master

## DOCUMENTATION

#### extra tools
    stack install hoogle hlint ormolu stylish-haskell
    stack hoogle -- generate

#### Locate the stack-installed hoogle
    stack exec which hoogle

### runs an Application on the given port:
  run :: Port -> Application -> IO ()
#### this uses:
  type Application = Request -> (Response -> IO ResponseReceived) -> IO ResponseReceived
