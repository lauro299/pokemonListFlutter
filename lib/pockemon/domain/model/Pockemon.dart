class Pokemon {
  final String name;
  final String? type;
  final int id;

  Pokemon({
    required this.name,
    required this.id,
    required this.type,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      type: json['type1'],
    );
  }
}