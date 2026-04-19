FROM grafana/k6:0.51.0

WORKDIR /scripts

# Copy only test files
COPY smoke.js .
COPY load.js .
COPY stress.js .

ENTRYPOINT ["k6"]