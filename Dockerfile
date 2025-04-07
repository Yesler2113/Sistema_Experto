FROM swipl:latest

WORKDIR /app

COPY server.pl .

EXPOSE 5000

CMD ["swipl", "-g", "start_server(5000)", "-t", "halt", "server.pl"]
