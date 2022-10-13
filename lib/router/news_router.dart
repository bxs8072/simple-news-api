import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:http/http.dart' as http;

class NewsRouter {
  String defaultLimit = "10";
  String gNewsApiKey = "10cccce5954fbc6fd670a33365480553";

  Handler get handler {
    Router router = Router();

    router.get("/api/v1/news/<max>", (Request request) async {
      String max = request.params["max"] ?? defaultLimit;
      String uri =
          "https://gnews.io/api/v4/top-headlines?max=$max&token=$gNewsApiKey";

      try {
        http.Response response = await http.get(Uri.parse(uri));
        return Future.sync(
          () => Response.ok(
            response.body,
            headers: {"Cache-Control": "max-age=3600"},
          ),
        );
      } catch (error) {
        return Future.sync(
          () => Response.badRequest(headers: {
            "status": 500,
          }, body: error),
        );
      }
    });

    router.post("/api/v1/news/search/<max>", (Request request) async {
      Map<String, dynamic> body = json.decode(await request.readAsString());
      String max = request.params["max"] ?? defaultLimit;
      String uri =
          'https://gnews.io/api/v4/search?q="${body["query"]}"&max=$max&token=$gNewsApiKey';

      try {
        http.Response response = await http.get(Uri.parse(uri));
        return Future.sync(
          () => Response.ok(
            response.body,
            headers: {"Cache-Control": "max-age=3600"},
          ),
        );
      } catch (error) {
        return Future.sync(
          () => Response.badRequest(headers: {
            "status": 500,
          }, body: error),
        );
      }
    });

    router.post("/api/v1/news/author/<max>", (Request request) async {
      Map<String, dynamic> body = json.decode(await request.readAsString());
      String max = request.params["max"] ?? defaultLimit;
      String uri =
          'https://gnews.io/api/v4/search?q="${body["author"]}"&in=source&max=$max&token=$gNewsApiKey';

      try {
        http.Response response = await http.get(Uri.parse(uri));
        return Future.sync(
          () => Response.ok(
            response.body,
            headers: {"Cache-Control": "max-age=3600"},
          ),
        );
      } catch (error) {
        return Future.sync(
          () => Response.badRequest(headers: {
            "status": 500,
          }, body: error),
        );
      }
    });

    return router;
  }
}
