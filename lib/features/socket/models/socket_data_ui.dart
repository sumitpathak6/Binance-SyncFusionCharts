class SocketDataModel {
  int lastUpdateId;
  List<List<String>> bids;

  SocketDataModel({
    required this.lastUpdateId,
    required this.bids,
  });

  factory SocketDataModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> bidsList = json['bids'];
    final List<List<String>> bids = bidsList.map((item) {
      final List<dynamic> innerList = item;
      final List<String> stringList = innerList.map((innerItem) {
        return innerItem.toString();
      }).toList();
      return stringList;
    }).toList();

    return SocketDataModel(
      lastUpdateId: json['lastUpdateId'],
      bids: bids,
    );
  }
}
