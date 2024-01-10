import 'dart:convert';
import 'package:get/get.dart';
import 'package:the_cart_app/models/product_model.dart';
import '../helper/shared_prefs.dart';
import '../repository/my_repo.dart';

class CartController extends GetxController {
  var selectedIndex = 0.obs;
  var productList = <ProductItem>[].obs;

  @override
  void onInit() {
    productList.value = myRepo.getProducts().mobiles!;
    super.onInit();
  }

  ///add item to the list
  void addItem() {
    var product = myRepo.getProducts();
    var category = getCategory();
    var length = category.length + 1;
    category.add(ProductItem(
        manufactureAddress: 'INDIA',
        manufactureDate: '2002-02-12',
        productName: 'Product $length',
        modelNumber: 1000 + length,
        price: 18000));
    switch (selectedIndex.value) {
      case 1:
        product.ac = category;
      case 2:
        product.laptop = category;
      case 3:
        product.camera = category;
      case 4:
        product.watches = category;
      default:
        product.mobiles = category;
    }
    localData.productList = jsonEncode(product);
    productList.value = category;
  }

  ///remove item to the list
  void deleteItem(ProductItem item) {
    var removeProduct = myRepo.getProducts();
    var category = getCategory();
    category.removeWhere((val) => val.modelNumber == item.modelNumber);
    switch (selectedIndex.value) {
      case 1:
        removeProduct.ac = category;
      case 2:
        removeProduct.laptop = category;
      case 3:
        removeProduct.camera = category;
      case 4:
        removeProduct.watches = category;
      default:
        removeProduct.mobiles = category;
    }
    localData.productList = jsonEncode(removeProduct);
    productList.value = category;
  }

  void rearrangeItem(List<ProductItem> itemsList) {
    var rearrangeProduct = myRepo.getProducts();
    switch (selectedIndex.value) {
      case 1:
        rearrangeProduct.ac = itemsList;
      case 2:
        rearrangeProduct.laptop = itemsList;
      case 3:
        rearrangeProduct.camera = itemsList;
      case 4:
        rearrangeProduct.watches = itemsList;
      default:
        rearrangeProduct.mobiles = itemsList;
    }
    localData.productList = jsonEncode(rearrangeProduct);
  }

  List<ProductItem> getCategory() {
    switch (selectedIndex.value) {
      case 1:
        return myRepo.getProducts().ac!;
      case 2:
        return myRepo.getProducts().laptop!;
      case 3:
        return myRepo.getProducts().camera!;
      case 4:
        return myRepo.getProducts().watches!;
      default:
        return myRepo.getProducts().mobiles!;
    }
  }

  void updateList() {
    switch (selectedIndex.value) {
      case 1:
        productList.value = myRepo.getProducts().ac!;
        break;
      case 2:
        productList.value = myRepo.getProducts().laptop!;
        break;
      case 3:
        productList.value = myRepo.getProducts().camera!;
        break;
      case 4:
        productList.value = myRepo.getProducts().watches!;
        break;
      default:
        productList.value = myRepo.getProducts().mobiles!;
        break;
    }
  }
}
