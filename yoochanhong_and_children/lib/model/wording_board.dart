class WordingBoard {
  String? wording;

  WordingBoard({this.wording});

  WordingBoard.fromJson(Map<String, dynamic> json) {
    wording = json['wording'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wording'] = wording;
    return data;
  }
}