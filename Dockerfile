FROM openjdk:13-slim

# RUNTIME ENVIRONMENT VARIABLES THAT CAN BE OVERRIDDEN USING:
# docker run --env KEY=VAL
ENV PORT 9000
ENV MEMORY 3g
ENV THREADS 8
ENV TIMEOUT 60000
ENV PRELOAD_ANNOTATORS tokenize,ssplit,pos,lemma,ner,depparse,coref,natlog,openie
ENV ANNOTATORS all

EXPOSE ${PORT}

ENV CORENLP_BUILD_DATE=2018-10-05
RUN apt-get update && apt-get install -y --no-install-recommends \
  unzip \
  curl \
  && rm -rf /var/lib/apt/lists/*
RUN curl -sLO http://nlp.stanford.edu/software/stanford-corenlp-full-${CORENLP_BUILD_DATE}.zip \
  && unzip stanford-corenlp-full-${CORENLP_BUILD_DATE}.zip \
  && rm stanford-corenlp-full-${CORENLP_BUILD_DATE}.zip

WORKDIR stanford-corenlp-full-${CORENLP_BUILD_DATE}
RUN export CLASSPATH="`find . -name '*.jar'`"

ENTRYPOINT exec java -cp "*" -Xms${MEMORY} -Xmx${MEMORY} edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port ${PORT} -quiet -threads ${THREADS} -timeout ${TIMEOUT} -preload ${PRELOAD_ANNOTATORS} -annotators ${ANNOTATORS}