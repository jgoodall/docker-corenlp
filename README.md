# corenlp-server

This image starts a [CoreNLP Server](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html).

To see the version of CoreNLP, see `ENV CORENLP_BUILD_DATE` in `Dockerfile`.

## Usage

To get started using the default port to listen on, run:

```docker run -p 9000:9000 jgoodall/corenlp```

To change the port/or memory allocation (set to at least `2g`) to listen on, run:

```docker run --env PORT=9123 --env MEMORY=4g -p 9123:9123 jgoodall/corenlp```

To test, send some text to the server:

```
curl --data "The quick brown fox jumps over the lazy dog." 'http://localhost:9000/?properties={%22annotators%22%3A%22tokenize%2Cssplit%2Cpos%2Cner%22%2C%22outputFormat%22%3A%22json%22}'
```

## Build Docker Image

To build and push the image to docker hub:

```sh
VERS=v0.1.0
git tag -a $VERS
git push --tag
docker build -t jgoodall/corenlp -t jgoodall/corenlp:$VERS .
docker push jgoodall/corenlp:latest
docker push jgoodall/corenlp:$VERS
```
