class CarouselModel {
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels = carouselsData
    .map((item) => CarouselModel(item['image'].toString()))
    .toList();

var carouselsData = [
  {"image": "assets/images/athome.jpg"},
  {"image": "assets/images/brokedown.jpg"},
  {"image": "assets/images/carwash.jpg"},
  {"image": "assets/images/deepclean.jpg"},
  {"image": "assets/images/pickup.jpg"},
  {"image": "assets/images/washdaily.jpg"},
  {"image": "assets/images/workshop.jpg"},
];
