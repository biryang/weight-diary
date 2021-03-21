class DiaryModel {
  final int id;
  final String date;
  final double weight;
  final String note;

  DiaryModel({this.id, this.date, this.weight, this.note});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'date': date,
      'weight': weight,
      'note': note,
    };
  }

  @override
  String toString() {
    return """
      DiaryModel {
        id: $id,
        date: $date, 
        weight: $weight, 
        note: $note
      }
    """;
  }
}
