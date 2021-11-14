class LocalUser {
  String? id;
  String name;
  String email;
  String location;

  LocalUser({
    this.id,
    required this.name,
    required this.email,
    required this.location,
  });

  Map<String, dynamic> toJson() => {'name': name, 'location': location};
}
