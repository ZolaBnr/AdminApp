import 'package:get_storage/get_storage.dart';
class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }
   LocalStorage._internal();
     final _storage = GetStorage();

   // Generic methode to save data
  Future<void> saveData<T>(String key,  T value) async{
     await _storage.write(key,value);
  }
 // Generic methode to read data
 T? readData<T> (String key){
     return _storage.read<T>(key);
 }
 // Generic methode to  remove data
   Future<void> removeData<T>(String key) async{
     await _storage.remove(key);
   }
   // clear all data in storage
   Future<void> clearAll() async{
     await _storage.erase();

   }
 }