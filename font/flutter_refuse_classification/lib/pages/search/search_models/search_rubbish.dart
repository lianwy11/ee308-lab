class SearchRubbish {
  SearchRubbish({
    required this.Rubbish,
    required this.Category,
  });
  late final String Rubbish;
  late final String Category;

  SearchRubbish.fromJson(Map<String, dynamic> json) {
    Rubbish = json['Rubbish'];
    Category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Rubbish'] = Rubbish;
    _data['Category'] = Category;
    return _data;
  }
}
