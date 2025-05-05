FROM docker.elastic.co/elasticsearch/elasticsearch:8.11.3

EXPOSE 9200 9300

ENV discovery.type=single-node

RUN bin/elasticsearch-plugin install analysis-icu
