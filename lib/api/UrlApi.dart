class ApiRoute {
  String url = "http://127.0.0.1:8080";

  ApiRoute(this.url);

  String get _baseUrl {
    return url;
  }

  set _baseUrl(String baseUrl) {
    this.url = baseUrl;
  }
}
