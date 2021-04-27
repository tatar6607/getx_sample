import 'package:get/get.dart';
import 'package:getx_sample/data/product_service.dart';

class ProductListController extends GetxController {
  RxList productsList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = ProductService.getAll();
    productsList.value = serverResponse;
  }
}
