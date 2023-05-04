import 'dart:convert';

Nfswusingurl nfswusingurlFromJson(String str) => Nfswusingurl.fromJson(json.decode(str));

String nfswusingurlToJson(Nfswusingurl data) => json.encode(data.toJson());

class Nfswusingurl {
  double? sexualActivity;
  double? sexualDisplay;
  double? erotica;
  double? suggestive;
  SuggestiveClasses? suggestiveClasses;
  double? none;

  Nfswusingurl({
    this.sexualActivity,
    this.sexualDisplay,
    this.erotica,
    this.suggestive,
    this.suggestiveClasses,
    this.none,
  });

  factory Nfswusingurl.fromJson(Map<String, dynamic> json) => Nfswusingurl(
    sexualActivity: json["sexual_activity"].toDouble(),
    sexualDisplay: json["sexual_display"].toDouble(),
    erotica: json["erotica"].toDouble(),
    suggestive: json["suggestive"].toDouble(),
    suggestiveClasses: SuggestiveClasses.fromJson(json["suggestive_classes"]),
    none: json["none"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "sexual_activity": sexualActivity,
    "sexual_display": sexualDisplay,
    "erotica": erotica,
    "suggestive": suggestive,
    "suggestive_classes": suggestiveClasses?.toJson(),
    "none": none,
  };
}

class SuggestiveClasses {
  double? bikini;
  double? cleavage;
  double? maleChest;
  double? lingerie;
  double? miniskirt;

  SuggestiveClasses({
    this.bikini,
    this.cleavage,
    this.maleChest,
    this.lingerie,
    this.miniskirt,
  });

  factory SuggestiveClasses.fromJson(Map<String, dynamic> json) => SuggestiveClasses(
    bikini: json["bikini"].toDouble(),
    cleavage: json["cleavage"].toDouble(),
    maleChest: json["male_chest"].toDouble(),
    lingerie: json["lingerie"].toDouble(),
    miniskirt: json["miniskirt"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "bikini": bikini,
    "cleavage": cleavage,
    "male_chest": maleChest,
    "lingerie": lingerie,
    "miniskirt": miniskirt,
  };
}
