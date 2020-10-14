

class ImageModel {

  int id;
  String url;
  String title;

  ImageModel.fromjson(Map<String, dynamic> json) {

    id = json['id'];
    url = json['url'];
    title = json['title'];

  }

}