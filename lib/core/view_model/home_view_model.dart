import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:retail_store/model/category_model.dart';

class HomeViewModel extends GetxController{
  
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  
  
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  
  final CollectionReference _categoryCollectionReference = FirebaseFirestore.instance.collection('Categories');

  HomeViewModel(){
    getCategory();
  }

  getCategory() async{
    _loading.value = true;
   try {
    final value = await _categoryCollectionReference.get();
    if (value != null && value.docs.isNotEmpty) {
      for (int i = 0; i < value.docs.length; i++) {
        final categoryData = value.docs[i].data();
        if (categoryData != null) {
          final categoryMap = categoryData as Map<String, dynamic>;
          final categoryModel = CategoryModel.fromJson(categoryMap);
          _categoryModel.add(categoryModel);
          print(categoryData);
          print(_categoryModel.length);
          _loading.value = false;
        }
      }
      update();
    } else {
      print("No category data found.");
    }
  } catch (e, stackTrace) {
    print("Error fetching category data: $e");
    print("StackTrace: $stackTrace");
  }
  }
}