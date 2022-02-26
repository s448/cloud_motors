class TravlogModel {
  String name;
  String content;
  String place;
  String image;

  TravlogModel(this.name, this.content, this.place, this.image);
}

List<TravlogModel> travlogs1 = travlogsData1
    .map((item) => TravlogModel(
        item['name'].toString(),
        item['content'].toString(),
        item['place'].toString(),
        item['image'].toString()))
    .toList();

var travlogsData1 = [
  {
    "name": "Home Service",
    "content": "Click Here to view all details",
    "place": "Book Now",
    "image": "assets/images/athome.jpg"
  },
  {
    "name": "Workshop Service",
    "content": "Click Here to view all details",
    "place": "Book Now",
    "image": "assets/images/workshop.jpg"
  },
];

List<TravlogModel> travlogs2 = travlogsData2
    .map(
      (item) => TravlogModel(
        item['name'].toString(),
        item['content'].toString(),
        item['place'].toString(),
        item['image'].toString(),
      ),
    )
    .toList();
var travlogsData2 = [
  // {
  //   "name": "Morning Wash",
  //   "content": "Click Here to view all details",
  //   "place": "Book Now",
  //   "image": "assets/images/carwash.jpg"
  // },
  {
    "name": "Deep Clean",
    "content": "Click Here to view all details",
    "place": "Book Now",
    "image": "assets/images/deepclean.jpg"
  },
  {
    "name": "Washing (Monthly)",
    "content": "Click Here to view all details",
    "place": "Book Now",
    "image": "assets/images/washdaily.jpg"
  },
];

List<TravlogModel> travlogs3 = travlogsData3
    .map((item) => TravlogModel(
        item['name'].toString(),
        item['content'].toString(),
        item['place'].toString(),
        item['image'].toString()))
    .toList();
var travlogsData3 = [
  {
    "name": "Vehicle Pickup",
    "content":
        "Book this service and we will pickup your vehicle from provided location to our workshop and repair it",
    "place": "Book Now",
    "image": "assets/images/pickup.jpg"
  },
  {
    "name": "Emergency Pickup",
    "content": "Vehicle Emergency?\nCall us and we will be there ASAP",
    "place": "Book Now",
    "image": "assets/images/brokedown.jpg"
  },
];

List homeDetails = [
  "Engine oil change",
  "Oil filter change",
  "Air filter clean",
  "Calliper greasing",
  "Brake pad check/replace",
  "Door greasing",
  "Windshield Shampoo",
  "Light check",
  "Coolant change",
  "Radiator Wash",
  "Brake fluid" "topup",
  "Battery water topup",
  "Suspension check",
  "Tyre check",
  "AC filter clean",
  "Washing",
  "Polish",
  "Paper mat",
  "Road test"
];
