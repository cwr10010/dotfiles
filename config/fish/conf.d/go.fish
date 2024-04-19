# setup golang here
set -x GOPATH "$HOME/.go"
set -x GOROOT (/opt/homebrew/bin/brew --prefix golang)"/libexec"
set -x PATH $GOPATH/bin $GOROOT/bin $PATH
test -d "$GOPATH" || mkdir "$GOPATH"
test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"
