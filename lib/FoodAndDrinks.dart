class FoodList {
  String tabName;
  List<FABList> fNBList;

  FoodList({this.tabName, this.fNBList});

  factory FoodList.fromJson(Map<String, dynamic> json) {
    var list = json['fnblist'] as List;
    print(list);
    List<FABList> fNBList = list.map((i) => FABList.fromJson(i)).toList();

    return FoodList(tabName: json["TabName"], fNBList: fNBList);
  }
}

class FABList {
  String cineMaid;
  String tabName;
  String vistaFoodItemId;
  String name;
  String priceInCents;
  String itemPrice;
  String sevenStarExperience;
  String otherExperience;
  int subItemCount;
  String imageUrl;
  String imgUrl;
  String vegClass;
  List<SubItem> subItems;

  FABList(
      {this.cineMaid,
      this.tabName,
      this.vistaFoodItemId,
      this.name,
      this.priceInCents,
      this.itemPrice,
      this.sevenStarExperience,
      this.otherExperience,
      this.subItemCount,
      this.imageUrl,
      this.imgUrl,
      this.vegClass,
      this.subItems});

  factory FABList.fromJson(Map<String, dynamic> json) {
    var list = json['subitems'] as List;
    print(list.runtimeType);
    List<SubItem> subItemsList = list.map((i) => SubItem.fromJson(i)).toList();
    return FABList(
        cineMaid: json["Cinemaid"],
        tabName: json["TabName"],
        vistaFoodItemId: json["VistaFoodItemId"],
        name: json["Name"],
        priceInCents: json["PriceInCents"],
        itemPrice: json["ItemPrice"],
        sevenStarExperience: json["SevenStarExperience"],
        otherExperience: json["OtherExperience"],
        subItemCount: json["SubItemCount"],
        imageUrl: json["ImageUrl"],
        imgUrl: json["ImgUrl"],
        vegClass: json["VegClass"],
        subItems: subItemsList);
  }
}

class SubItem {
  String name;
  String priceInCents;
  String subItemPrice;
  String vistaParentFoodItemId;
  String vistaSubFoodItemId;

  SubItem(
      {this.name,
      this.priceInCents,
      this.subItemPrice,
      this.vistaParentFoodItemId,
      this.vistaSubFoodItemId});

  factory SubItem.fromJson(Map<String, dynamic> json) {
    return SubItem(
        name: json["Name"],
        priceInCents: json["PriceInCents"],
        subItemPrice: json["SubitemPrice"],
        vistaParentFoodItemId: json["VistaParentFoodItemId"],
        vistaSubFoodItemId: json["VistaSubFoodItemId"]);
  }
}
