.PHONY: build clean run

GO=go
GOFLAGS=-ldflags="-s -w"
UPX=upx
UPXFLAGS=--brute
BINARY_NAME=vanityssh
BINARY_WINDOWS=$(BINARY_NAME).exe

build:
	$(GO) build $(GOFLAGS) -o $(BINARY_NAME) vanityssh.go
	env GOOS=windows GOARCH=amd64 $(GO) build $(GOFLAGS) -o $(BINARY_WINDOWS) vanityssh.go

compress:
	$(UPX) $(UPXFLAGS) $(BINARY_NAME)
	$(UPX) $(UPXFLAGS) $(BINARY_WINDOWS)

clean:
	$(GO) clean
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_WINDOWS)
	