class QueryModel {
  String id;
  String productName;
  String productId;
  bool queryStatus;
  List<dynamic> replies;

  QueryModel(
      {this.id,
      this.productName,
      this.queryStatus,
      this.replies,
      this.productId});
}
