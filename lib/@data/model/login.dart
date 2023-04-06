class Login {
  String refresh;
  String access;
  String detail;

  Login({
    required this.refresh,
    required this.access,
    required this.detail,
  });

  factory Login.fromMap(Map json) {
    var refresh = '';
    var access = '';
    var detail = '';
    if (json["refresh"] != null || json["access"] != null) {
      refresh = json["refresh"];
      access = json["access"];
    } else {
      detail = json["detail"];
    }
    return Login(refresh: refresh, access: access, detail: detail);
  }
}
