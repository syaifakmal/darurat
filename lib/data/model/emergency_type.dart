class EmergencyType {
  EmergencyType({
    required this.title,
    required this.type,
  });

  String title;
  String type;

  factory EmergencyType.fromJson(Map<String, dynamic> json) => EmergencyType(
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
      };
}
