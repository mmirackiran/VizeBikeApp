import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isFirtsLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    var counter = storage.getInt("launchCount");

    if (runned == null) {
      counter = 1;
      await storage.setInt("launchCount", 1);
      return true;
    } else {
      await storage.setInt("launchCount", counter! + 1);
      return false;
    }
  }

  firstLaunched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool("runned", true);
  }

  setConfig({String? language}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    if (language != null) {
      await storage.setString("language", language);
    }
  }

  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return {"language": storage.getString("language")};
  }
}
