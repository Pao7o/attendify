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

void main() {
  var array1 = [1, 0, 2, 3, 4];

  var array2 = [3, 5, 6, 7, 8, 13];

  var sumArray = [];

  if (array1.length > array2.length) {
    for (var i = 0; i < array1.length; i++) {
      sumArray[i] = array1[i] + array2[i];
    }
  } else {
    for (var i = 0; i < array2.length; i++) {
      sumArray[i] = array2[i] + array1[i];
    }
  }

  print(sumArray);
}
