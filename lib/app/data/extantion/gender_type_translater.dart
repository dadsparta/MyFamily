import 'package:myfamily/core/values/gender_types.dart';

extension GenderTypeTranslater on GenderTypes{
  String translate(){
    switch (this){
      case GenderTypes.first:
        return 'first';
      case GenderTypes.second:
        return 'second';
      case GenderTypes.third:
        return 'third';
      default: return'';
    }
  }
}