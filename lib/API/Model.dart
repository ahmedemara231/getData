class Model
{
  List<dynamic> results;
  Map<String, dynamic > info;
  int? id; // على افتراض انه موجود بال location

  Model({
    required this.results,
    required this.info,
    this.id
});

  factory Model.fromJson(Map<String,dynamic> jsonData)
  {
    return Model(
        results: jsonData['results'],
        info: jsonData['info'],
      id: jsonData['id'],
    );
  }
}