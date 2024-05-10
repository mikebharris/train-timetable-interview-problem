# Train Timetable Interview Problem - solution in Go

To get it running you will need to do (Linux, macOS and Cygwin):
```shell
cd journeyplanner
go get github.com/stretchr/testify/assert
export GOPATH=~/go && export PATH=$GOPATH/bin:$PATH

go build journeyplanner.go && go test
```

Before running and developing in IntelliJ you will need to initialise with:

```shell
cd journeyplanner
go mod init journeyplanner
```