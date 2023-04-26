class PurchasesModel {
  String? title;
  String? subTitle;
  double? price;
  int? playsCount;
  bool? showBadge;

  PurchasesModel(
      {this.title, this.subTitle, this.price, this.playsCount, this.showBadge});

  PurchasesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['sub_title'];
    price = json['price'];
    playsCount = json['plays_count'];
    showBadge = json['show_badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['price'] = price;
    data['plays_count'] = playsCount;
    data['show_badge'] = showBadge;
    return data;
  }
}