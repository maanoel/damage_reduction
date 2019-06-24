class AcessLogin{

  final bool autenticated;
  final DateTime created;
  final DateTime expiration;
  final String acessToken;
  final String messageStatus;

  AcessLogin.fromJSON(Map<String, dynamic> jsonMap) :
        autenticated = jsonMap['autenticated'],
        created = jsonMap['created'],
        expiration = jsonMap['expiration'],
        acessToken = jsonMap['description'],
        messageStatus = jsonMap['messageStatus'];

}