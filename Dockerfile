FROM karm/mod_cluster-master-dockerhub:latest
MAINTAINER Your identity of choice <your email>

# Your own configuration located in the same directory as your Dockerfile
COPY mod_cluster.conf ${HTTPD_MC_BUILD_DIR}/conf/extra/mod_cluster.conf

# Your own entry point script located in the same directory as your Dockerfile
COPY docker-entrypoint.sh /
