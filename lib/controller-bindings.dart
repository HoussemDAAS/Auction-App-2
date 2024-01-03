import 'package:auction_app/controllers/authController.dart';
import 'package:auction_app/controllers/itemsController.dart';
import 'package:get/get.dart';

class ControllereBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ItemsController());
  }

}