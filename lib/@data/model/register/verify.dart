class Verify {
  String token;

  Verify({
    required this.token,
  });

  factory Verify.fromMap(Map json) {
    return Verify(token: json["token"]);
  }
}
