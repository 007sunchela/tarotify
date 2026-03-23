class TarotCard {
  final int id;
  final int idType;
  final int? idSuit;
  final String name;
  final int value;
  final String url;
  final String meanOne;
  final String meanTwo;
  final String desc;

  TarotCard({
    required this.id,
    required this.idType,
    this.idSuit,
    required this.name,
    required this.value,
    required this.url,
    required this.meanOne,
    required this.meanTwo,
    required this.desc,
  });

  factory TarotCard.fromJson(Map<String, dynamic> json) {
    return TarotCard(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      idType: json['type'],
      idSuit: json['suit'],
      value: json['value'],
      meanOne: json['general']['direct_meaning'],
      meanTwo: json['general']['metaphorical_meaning'],
      desc: json['general']['interpretation'],
    );
  }
}
