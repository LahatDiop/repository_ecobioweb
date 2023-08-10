
import '../../models/term_of_service.dart';
/// [SignUpData] model is to store/transfer signup mode data.

class SignupData {
    /// Contains [name], [email], [password] and [confirmPassword] fields.
  /// Overrides [toString], [hashCode] methods and [==] operator.
  late String? name;
  late String? password;
  late Map<String, String>? additionalSignupData;
  late List<TermOfServiceResult> termsOfService;
  //List<String> triggerImagesUrl;
  //List<int> triggerChannelIds;
  // dynamic actionImages;
  //List<dynamic> actionImagesUrl;

  SignupData(
      this.name, this.password, this.termsOfService, this.additionalSignupData);

  SignupData.frbomSignupForm(
      {required this.name,
      required this.password,
      this.additionalSignupData,
      this.termsOfService = const []});

  SignupData.fromProvider({
    required this.additionalSignupData,
    this.termsOfService = const [],
  })  : name = null,
        password = null;

  static SignupData? fromSignupForm(
      {required String name,
      required String password,
      Map<String, String>? additionalSignupData,
      required List<TermOfServiceResult> termsOfService}) {
        return null;
      }

  static Map<String, dynamic> fromSignupForms({
    required String name,
    required String password,
    required Map<String, String>? additionalSignupData,
    required List<TermOfServiceResult> termsOfService,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['termsOfService'] = termsOfService;
    data['additionalSignupData'] = additionalSignupData;
    return data;
  }

  SignupData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    termsOfService = json['termsOfService'];
    additionalSignupData = json['additionalSignupData'];
  }

  factory SignupData.fromJsonFactory(Map<String, dynamic> json) {
    String name = json['name'];
    String password = json['password'];
    List<TermOfServiceResult> termsOfService = json['termsOfService'];
    Map<String, String>? additionalSignupData = json['additionalSignupData'];

    return SignupData(name, password, termsOfService, additionalSignupData);
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = <String, dynamic>{};
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['password'] = password;
    data['termsOfService'] = termsOfService;
    data['additionalSignupData'] = additionalSignupData;
    return data;
  }

  /*/@override
  String toString() {
    return '"signupData" :{"name":$name, "password":$password,"additionalSignupData":$additionalSignupData,"termsOfService",$termsOfService}';
  }
*/
    /// Overrides the [toString] method.
  @override
  String toString() => 'SignupData($name, $password,$additionalSignupData,$termsOfService)';

  @override
  bool operator ==(Object other) {
    if (other is SignupData) {
      return name == other.name &&
          password == other.password &&
          additionalSignupData == other.additionalSignupData;
    }
    return false; 
  }

 // @override
//  int get hashCode => hash3(name, password, additionalSignupData);

}
