
import 'package:coach_netic/models/user.dart';
import 'package:coach_netic/config/config.dart';
class GlobalValues{
 static User user;
}

String getImageFromName({String imageName}) {
 String name = imageName;

 return IMAGE_PATH_URL + name;
}
