class cars{
 final String  num_models;
  String img_url;
  String max_car_id;
  String id;
  String name;
  String avg_horsepower;
  String avg_price;

  cars( {this.num_models, this.img_url, this.max_car_id, this.id, this.name,
      this.avg_horsepower, this.avg_price});

  factory cars.fromJson(Map<String, dynamic> json){
    return  cars(
        num_models: json['num_models'].toString(),
        img_url: json['img_url'].toString(),
        max_car_id: json['max_car_id'].toString(),
        id: json['id'].toString(),
        name: json['name'].toString(),
        avg_horsepower: json['avg_horsepower'].toString(),
        avg_price: json['avg_price'].toString());
  }
}
