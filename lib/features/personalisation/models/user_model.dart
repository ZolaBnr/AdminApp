import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/formaters/formatter.dart';

/// Model class representing user data
class UserModel {
  // keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format number
  String get formattedPhoneNo => Formatter.formatPhoneNumberAlgerian(phoneNumber);

  /// static function to split full name into first name and last name
  static List<String>nameParts(fullName) => fullName.split("");

  /// static function to generate a username from the full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add "cwt\_" prefix
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  /// Convert model to JSON for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'Email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}