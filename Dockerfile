FROM openjdk:11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
 	  unzip \
	  wget \
  && rm -rf /var/lib/apt/lists/*

ENV CORENLP_BUILD_DATE=2018-10-05
RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-${CORENLP_BUILD_DATE}.zip && \
    unzip stanford-corenlp-full-${CORENLP_BUILD_DATE}.zip && \
	  rm stanford-corenlp-full-${CORENLP_BUILD_DATE}.zip

WORKDIR stanford-corenlp-full-${CORENLP_BUILD_DATE}

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000
EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT -quiet -timeout 15000 -preload tokenize,ssplit,pos,lemma,ner,depparse,coref,natlog,openie -annotators all