import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {

   
    Get.put<SurveyController>(SurveyController());
  }
}