import 'package:get/get.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/resource/resource.dart';

class InputDataProvider extends BaseProvider{

  Future<Response> getData(){
    return get('${ApiConstants.getData}?uid=${AppPref.uid}');
  }
}