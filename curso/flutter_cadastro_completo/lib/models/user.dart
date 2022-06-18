class User {
  //classe usuario
  final String? id;
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    //construtor é constante por causa da variaveis final
    this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}
