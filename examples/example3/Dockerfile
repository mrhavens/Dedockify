# My New Dockerfile

FROM alpine:3.9.2
RUN apk add --no-cache nasm
WORKDIR /app
COPY hello.s /app/hello.s
RUN touch testfile && \
	nasm -f bin -o hello hello.s && \
	chmod +x hello

FROM scratch
WORKDIR /testdir1
COPY --from=0 /app/testfile testfile1
WORKDIR /testdir2
COPY --from=0 /app/testfile testfile2
WORKDIR /testdir3
COPY --from=0 /app/testfile testfile3
WORKDIR /app
COPY --from=0 /app/hello hello
ENTRYPOINT ["/app/hello"]
