# setup golang here
set -x GOPATH "$HOME/.go"
set -x GOROOT "(brew --prefix golang)/libexec"
set -x PATH "$PATH:$GOPATH/bin:$GOROOT/bin"
test -d "$GOPATH" || mkdir "$GOPATH"
test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"
