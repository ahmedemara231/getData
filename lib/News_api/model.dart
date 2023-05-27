class Model2
{
  String status;
  int totalResults;
  List<dynamic> articles;

  Model2({
    required this.status,
    required this.totalResults,
    required this.articles
});

  factory Model2.fromJson(Map<String, dynamic> jsonData)
  {
    return Model2(
        status: jsonData['status'],
        totalResults: jsonData['totalResults'],
        articles: jsonData['articles']
    );
  }
}