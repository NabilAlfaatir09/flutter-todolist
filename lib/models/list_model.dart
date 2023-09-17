class ListModel {
  String id, text;
  bool isDone;
  ListModel({required this.id, required this.text, this.isDone = false});

  static List<ListModel> listModelfunc() {
    return [
      ListModel(id: "1", text: "membuat project flutter", isDone: true),
      ListModel(id: "2", text: "membersihkan rumah", isDone: true),
      ListModel(id: "3", text: "membaca buku setiap hari"),
      ListModel(id: "4", text: "olahraga"),
      ListModel(id: "5", text: "belajar hal baru"),
      ListModel(id: "6", text: "main game"),
    ];
  }
}
