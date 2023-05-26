class Model
{
  List<dynamic> results;


  Model({
    required this.results,
});

  factory Model.fromJson(Map<String,dynamic> jsonData)
  {
    return Model(results: jsonData['results']);
  }
}