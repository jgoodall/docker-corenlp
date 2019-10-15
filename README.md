# corenlp-server

This image starts a [CoreNLP Server](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html) on port 9000.

Updated to latest version: stanford-corenlp-full-2018-10-05

## Usage

To get started, run:

```docker run -p 9000:9000 jgoodall/corenlp```

To control [the port and other command line options](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html):

```docker run -p 9123:9123 jgoodall/corenlp java -cp "*" -mx2g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9123```

## Docker

To build and push the image to docker hub:

```sh
VERS=v0.0.6
git tag -a $VERS
docker build -t jgoodall/corenlp:latest .
docker push jgoodall/corenlp:latest
docker build -t jgoodall/corenlp:$VERS .
docker push jgoodall/corenlp:$VERS
```
