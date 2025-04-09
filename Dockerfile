FROM swipl:latest

WORKDIR /app

COPY server.pl .

EXPOSE 4000

CMD ["swipl", "-g", "start_server(4000), wait_forever", "server.pl"]
