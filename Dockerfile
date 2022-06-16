FROM docker
# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Run your program under Tini
CMD ["while true; do docker system prune --all --force --volumes && sleep 3600; done"]
# or docker run your-image /your/program ...
