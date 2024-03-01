import 'package:myfamily/core/values/gender_types.dart';

extension GenderTypeTranslater on GenderTypes{
  String translate(){
    switch (this){
      case GenderTypes.male:
        return 'Yan';
      case GenderTypes.female:
        return 'Hanna';
      case GenderTypes.Our:
        return 'Own';
      default: return'';
    }
  }
}