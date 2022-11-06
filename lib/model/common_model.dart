class CommonModel {
  String? title = "";
  String? image = "";
  String? subTitle = "";
  bool? isSelect = false;
  int? value;

  CommonModel({
    this.title,
    this.image,
    this.subTitle,
    this.isSelect,
    this.value,
  });

  factory CommonModel.fromDocument(CommonModel document) {
    return CommonModel(
      title: document.title,
      image: document.image,
      subTitle: document.subTitle,
      isSelect: document.isSelect,
      value: document.value,
    );
  }
}
