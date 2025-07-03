import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hapticfone/utils/constants/tformatter.dart';

class Usermodel {
  final String id;
  String fullname;
  final String email;
  String phonenumber;
  String profilepicture;
  final String password;
  Usermodel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phonenumber,
    required this.profilepicture,
    required this.password,
  });
  // Helper function to get the fullname
  String get fullnamee => fullname;

  // Helper function to Format Phone number
  String get formtedphonenumber => Tformatter.formatphoneNumber(phonenumber);
  static Usermodel empty() => Usermodel(
    id: "",
    fullname: "EMPTY NAME",
    email: "EMPTY EMAIL",
    phonenumber: "Empty PHONE NUMBER",
    profilepicture: "",
    password: "password",
  );
  static String username(fullname) {
    String username = fullname;

    return username;
  }

  // Convert model to JSON Structure for Storing data in Firebase
  // this things are store data inside the firestore
  Map<String, dynamic> toJson() {
    return {
      "Username": fullname,
      "Email": email,
      "phonenumber": phonenumber,
      "profilepicture": profilepicture,
      "password": password,
      "user id": id,
    };
  }

  factory Usermodel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return Usermodel(
        id: document.id,
        fullname: data["Username"] ?? "",
        email: data["Email"] ?? "NO EMAIL GET",
        phonenumber: data["phonenumber"] ?? "",
        profilepicture: data["profilepicture"] ?? "",
        password: data["password"] ?? "",
      );
    }
    return Usermodel(
      id: "",
      fullname: "",
      email: "NO EMAIL GETT",
      phonenumber: "",
      profilepicture: "",
      password: "No password",
    );
  }
}
