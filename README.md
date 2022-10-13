A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart pub get
$ dart run bin/server.dart
Server listening on port 8080
```

## Running with Docker
If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

## Example Requests
# To get N number of top news send requests
Send HTTP GET request on address http://localhost:8080/api/v1/news/N where N is max number of articles to be fetched.
```
$ curl http://localhost:8080/api/v1/news/5
```


# To get N number of news filtered by keywords query
Send HTTP POST request on address http://localhost:8080/api/v1/news/search/N and query on body as {"query": "keywords"} where N is max number of articles to be fetched.
```
$ curl -X POST http://localhost:8080/api/v1/news/search/5 -d '{"query": "Steal"}'

```


# To get N number of news filtered by author name
Send HTTP POST request on address http://localhost:8080/api/v1/news/author/N and query on body as {"author": "keywords"} where N is max number of articles to be fetched.
```
$ curl -X POST http://localhost:8080/api/v1/news/author/5 -d '{"author": "AP News"}'

```