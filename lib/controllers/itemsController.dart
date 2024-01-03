import 'dart:io';

import 'package:auction_app/controllers/authController.dart';
import 'package:auction_app/models/item.model.dart';
import 'package:auction_app/pages/navigationPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  RxList items = [].obs;
  RxBool isLoading = true.obs;
  RxBool isAdding = false.obs;
  Rx<PlatformFile?> pickedFile = Rx<PlatformFile?>(null);
  Rx<UploadTask?> uploadTask = Rx<UploadTask?>(null);
  String urlDownload = '';

  getItems() => items;
  getIsLoading() => isLoading;
  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  void fetchItems() async {
    try {
      isLoading(true);
      var itemsFromServer = await FirebaseFirestore.instance
          .collection('items')
          .get()
          .then((value) =>
              value.docs.map((e) => ItemModel.fromJson(e)).toList());
      if (itemsFromServer.isNotEmpty) {
        items.assignAll(itemsFromServer);
      }
    } finally {
      isLoading(false);
    }
  }

  void addItem(ItemModel item) async {
    ItemsController itemsController = Get.find();
    try {
      isAdding(true);
      await uploadFile();
      FirebaseFirestore.instance.collection('items').add({
        'titre' : item.title ,
        'image' : urlDownload ,
        'deadline' : item.deadline ,
        'min' : item.min ,
        'max'   :item.max , 
        'publisher' : AuthController.instance.getUser().uid ,
        'description' : item.description
      });
    } finally {
      isAdding(false);
       itemsController.fetchItems();
    Get.to(()=> const NavigationPage());
    }
  }

  Future<void> selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      pickedFile.value = result.files.first;
    }
  }
  Future uploadFile() async{
    final path = 'items/${pickedFile.value!.name}' ;
    final file  = File(pickedFile.value!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
     uploadTask.value =  ref.putFile(file);
    final snapshot = await uploadTask.value!.whenComplete(() {});
     urlDownload = await snapshot.ref.getDownloadURL();
    print(urlDownload);
  }
}
