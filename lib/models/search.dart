class Search {
  late String url;
  late List<String> tags;
  late String contentType;
  late String title;
  late String date;
  static const String URL = "url";
  static const String TAGS = "tags";
  static const String CONTENT_TYPE = "contentType";
  static const String TITLE = "title";
  static const String DATE = "date";

  Search();
  factory Search.fromJsonOrNull(Map<String, dynamic> json) {
    Search article = Search();

    article.url = json[URL] == null ? "" : json[URL].toString();

    List<String> strs = json[TAGS] == null ? [] : json[TAGS].cast<String>();
    article.tags = strs;

    article.contentType =
        json[CONTENT_TYPE] == null ? "" : json[CONTENT_TYPE].toString();

    article.title = json[TITLE] == null ? "" : json[TITLE].toString();

    article.date = json[DATE] == null ? "" : json[DATE].toString();

    return article;
  }
  Map<String, dynamic> toJson() {
    return {
      URL: url,
      TAGS: tags,
      CONTENT_TYPE: contentType,
      TITLE: title,
      DATE: date,
    };
  }
}
