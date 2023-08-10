
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'customerSetting.g.dart';
//part of 'app_database.dart';

@JsonSerializable()
// class CustomerSetting extends StatelessWidget {
class ItemSetting {
  Widget? thumbnail;
  Icon? trailing;
  String? description;
  String? title;
  String? category;
  String? imageUrl;
  String? subtitle; //
  String? statusProducerSetting; // produttore
  String? statusCustomerSetting; // cliente
  String? messagesSetting;
  bool? enabledSetting; // ON /OFF
  String? publishDate;
  Function(dynamic context)? builder;
   List<Abilities>? abilities;

  ItemSetting({
      this.thumbnail,
      this.trailing,
      this.description,
      this.title,
      this.category,
      this.imageUrl,
      this.subtitle,
      this.statusProducerSetting,
      this.statusCustomerSetting,
      this.messagesSetting,
      this.enabledSetting,
      this.publishDate,
      this.builder,
      this.abilities,
});


  //factory CustomerSetting.fromJson(Map<String, dynamic> json) => _$CustomerSetting(json);
 // Map<String, dynamic> toJson() => _$CustomerSettingToJson(this);


  factory ItemSetting.fromJson(Map<String,dynamic> json){
    return ItemSetting(
      thumbnail : json["thumbnail"],
      trailing : json["trailing"],
      description : json["description"],
      title : json["title"],
      category : json["category"],
      imageUrl : json["imageUrl "],
      subtitle : json[" subtitle"],
      statusProducerSetting:json["statusProducerSetting "],
      statusCustomerSetting:json["statusCustomerSetting "],
      messagesSetting : json[" messagesSetting"],
      enabledSetting : json["enabledSetting "],
      publishDate : json["publishDate "],
      builder : json["builder "],
      abilities : json["abilities "],

    );
  }

  Map<String,dynamic> toJson() =>{
  'thumbnail ' :thumbnail,
  'trailing ' :trailing,
  'description ' :description,
  'title ' :title,
  'category ' :category,
  'imageUrl ' :imageUrl ,
  'subtitle ' : subtitle,
  'statusProducerSetting' :statusProducerSetting ,
  'statusCustomerSetting' :statusCustomerSetting ,
  'messagesSetting' : messagesSetting,
  'enabledSetting ' :enabledSetting ,
  'publishDate ' :publishDate ,
  'builder ' :builder ,
  'abilities ' :abilities ,
};

ItemSetting copy({
  Icon? trailing,
  String? description,
  String? title,
  String? category,
  String? imageUrl,
  String? subtitle, //
  String? statusProducerSetting, // produttore
  String? statusCustomerSetting, // cliente
  String? messagesSetting,
  bool? enabledSetting, // ON /OFF
  String? publishDate,
  Function(dynamic context)? builder,
   List<Abilities>? abilities,
}) => ItemSetting(
  thumbnail : thumbnail ?? thumbnail,
  trailing : trailing ?? this.trailing,
  description : description ?? this.description,
  title : title ?? this.title,
  category : category?? this.category,
  imageUrl : imageUrl ?? this.imageUrl,
  subtitle :subtitle ?? this.subtitle,
  statusProducerSetting: statusProducerSetting?? this.statusProducerSetting,
  statusCustomerSetting: statusCustomerSetting?? this.statusCustomerSetting,
  messagesSetting : messagesSetting ?? this.messagesSetting,
  enabledSetting : enabledSetting?? this.enabledSetting,
  publishDate :  publishDate?? this.publishDate,
  builder :  builder?? this.builder,
  abilities : abilities ?? this.abilities,
);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemSetting &&
          runtimeType == other.runtimeType &&
          thumbnail == other.thumbnail &&
          trailing == other.trailing &&
          description == other.description &&
          title == other.title &&
          category == other.category &&
          imageUrl == other.imageUrl &&
          subtitle == other.subtitle &&
          statusProducerSetting == other.statusProducerSetting &&
          statusCustomerSetting == other.statusCustomerSetting &&
          messagesSetting == other.messagesSetting &&
          enabledSetting == other.enabledSetting &&
          publishDate == other.publishDate &&
          builder == other.builder &&
          abilities == other.abilities;

  @override
  int get hashCode =>
      thumbnail.hashCode ^
      trailing.hashCode ^
      description.hashCode ^
      title.hashCode ^
      category.hashCode ^
      imageUrl.hashCode ^
      subtitle.hashCode ^
      statusProducerSetting.hashCode ^
      statusCustomerSetting.hashCode ^
      messagesSetting.hashCode ^
      enabledSetting.hashCode ^
      publishDate.hashCode ^
      builder.hashCode ^
      abilities.hashCode;

  @override
  String toString() {
    return 'CustomerSetting{thumbnail: $thumbnail, trailing: $trailing, description: $description, title: $title, category: $category, imageUrl: $imageUrl, subtitle: $subtitle, statusProducerSetting: $statusProducerSetting, statusCustomerSetting: $statusCustomerSetting, messagesSetting: $messagesSetting, enabledSetting: $enabledSetting, publishDate: $publishDate, builder: $builder, abilities: $abilities}';
  }

  ItemSetting.name(
      this.thumbnail,
      this.trailing,
      this.description,
      this.title,
      this.category,
      this.imageUrl,
      this.subtitle,
      this.statusProducerSetting,
      this.statusCustomerSetting,
      this.messagesSetting,
      this.enabledSetting,
      this.publishDate,
      this.builder,
      this.abilities);




// CustomerSetting({
  //   //Key? key,
  //   this.trailing,
  //   this.thumbnail,
  //   this.description,
  //   this.title,
  //   this.category,
  //   this.imageUrl,
  //   this.subtitle,
  //   this.statusProducerSetting,
  //   this.statusCustomerSetting,
  //   this.messagesSetting,
  //   this.enabledSetting,
  //   this.publishDate,
  //   this.builder,
  //   // required IconData ,
  // })// : super(key: key);
  //




  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
}




class Abilities {
  late String name;
  late String description;

  Abilities({required this.name, required this.description});

  Abilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

/*@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: description,
                  subtitle: subtitle,
                  author: description,
                  publishDate: publishDate,
                  readDuration: '2',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
/*class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key? key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  String? title;
  String? subtitle;
  String? author;
  String? publishDate;
  String? readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                author!,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*/
