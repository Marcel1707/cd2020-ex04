FROM golang:1.11-alpine
RUN apk add build-base

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer=marcel.ciesla1707@gmail.com

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY main.go ./
COPY main_test.go ./

RUN go mod init github.com/Marcel1707/cd2020-ex04
RUN go mod tidy

# List items in the working directory (ls)
RUN ls

RUN go test -v

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o /usr/myapp

#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD [ "/usr/myapp" ]
