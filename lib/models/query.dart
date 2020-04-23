class QueryModel {
  String id;
  String productName;
  String productId;
  String queryStatus;
  List<String> replies;

  QueryModel(
      {this.id,
      this.productName,
      this.queryStatus,
      this.replies,
      this.productId});
}
