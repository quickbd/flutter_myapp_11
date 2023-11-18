import 'package:get_storage/get_storage.dart';

class StorageUtils{

  static final _storage = GetStorage();
  static final _loginKey = 'loginKey';
  static final _loginInfo = 'loginInfo';

  static bool isFirstTimeLogin(){   //for read
    return _storage.read(_loginKey) ?? true;
  }

  static String getInfo(){
    return _storage.read(_loginInfo);
  }

  static void setLoginData(bool value, loginInfo){   //for write
     _storage.write(_loginKey, value);
     _storage.write(_loginInfo, loginInfo);
  }
}