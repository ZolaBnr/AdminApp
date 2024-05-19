import 'package:intl/intl.dart';
 class Formatter{
    static String formatDate(DateTime? date){
      date ??=DateTime.now();
      return DateFormat('dd-MM-yyyy').format(date);
    }
    static String formatPhoneNumberAlgerian(String phoneNumber){
      if (phoneNumber.length < 10 || phoneNumber.length > 12) {
        throw ArgumentError('Invalid phone number length');
      }
      if (phoneNumber.length == 10) {
        return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
      } else {
        return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, 10)}';
      }
    }
 }