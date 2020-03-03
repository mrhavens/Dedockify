FROM scratch
WORKDIR /testdir1
COPY testfile1 .
WORKDIR /testdir2
COPY testfile2 .
WORKDIR /testdir3
COPY testfile3 .
WORKDIR /app
COPY hello .
ENTRYPOINT ["/app/hello"]
