import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:the_cart_app/controllers/cart_controller.dart';
import 'package:the_cart_app/helper/my_constants.dart';
import 'package:the_cart_app/helper/shared_prefs.dart';
import '../helper/routes.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Obx(() => productList()),
      bottomNavigationBar: Obx(
        () => bottomNavigator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addItem();
        },
        backgroundColor: myConstant.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  PreferredSizeWidget customAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        localData.loggedInUser,
        style: const TextStyle(color: Colors.white),
      ),
      leading: Container(
        margin: const EdgeInsets.all(4),
        child: const CircleAvatar(
            child: Icon(
          Icons.person,
          color: Colors.white,
        )),
      ),
      actions: [
        InkWell(
          onTap: () {
            showAlertDialog(context);
          },
          child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              )),
        )
      ],
      backgroundColor: myConstant.primaryColor,
    );
  }

  Widget productList() {
    if (controller.productList.isEmpty) {
      return const Center(
        child: Text('No Product Found'),
      );
    }
    return ReorderableListView(
      children: controller.productList
          .map((item) => Slidable(
                key: UniqueKey(),
                //  key: ObjectKey(item.modelNumber),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                      key: UniqueKey(),
                      onDismissed: () {
                        controller.deleteItem(item);
                      }),
                  children: [
                    SlidableAction(
                      onPressed: (val) {
                        controller.deleteItem(item);
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  //key: GlobalObjectKey("$item"),
                  child: ExpansionTile(
                    title: Text("${item.productName}"),
                    trailing: const Icon(Icons.menu),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    expandedAlignment: Alignment.centerLeft,
                    childrenPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    children: [
                      Text('Price - ₹${item.price}'),
                      Text('Model Number - ${item.modelNumber}'),
                      Text('Manufacture Address - ${item.manufactureAddress}'),
                      Text('Manufacture Address - ${item.manufactureDate}'),
                    ],
                  ),
                ),
              ))
          .toList(),
      onReorder: (int start, int current) {
        // dragging from top to bottom
        if (start < current) {
          int end = current - 1;
          var startItem = controller.productList[start];
          int i = 0;
          int local = start;
          do {
            controller.productList[local] = controller.productList[++local];
            i++;
          } while (i < end - start);
          controller.productList[end] = startItem;
        }
        // dragging from bottom to top
        else if (start > current) {
          var startItem = controller.productList[start];
          for (int i = start; i > current; i--) {
            controller.productList[i] = controller.productList[i - 1];
          }
          controller.productList[current] = startItem;
        }
        controller.rearrangeItem(controller.productList);
      },
    );
  }

  Widget bottomNavigator() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (val) {
        controller.selectedIndex.value = val;
        controller.updateList();
      },
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.grey,
      backgroundColor: myConstant.primaryColor,
      currentIndex: controller.selectedIndex.value,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Mobiles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: 'AC',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.laptop),
          label: 'Laptop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.watch),
          label: 'Watch',
        ),
      ],
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: const Text("Cancel"),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = ElevatedButton(
    child: const Text("Logout"),
    onPressed: () {
      localData.logout();
      Get.back();
      Get.offAllNamed(login);
    },
  ); // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert!"),
    content: const Text("Do you want to Logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  ); // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
