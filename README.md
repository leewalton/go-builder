# go-builder

Simple multistage Docker build example.

To build:
`docker build -t gobuilder:latest .`

To run:
`docker run -d --rm -p 8080:8080 gobuilder:latest`

If you just want to compile, without the final Docker build:
`docker build --target appbuild -t appbuilder:latest .`
