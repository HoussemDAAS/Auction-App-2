import 'dart:io';

import 'package:auction_app/controllers/itemsController.dart';
import 'package:auction_app/models/item.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _imageController;
  late TextEditingController _titleController;
  late TextEditingController _deadlineController;
  late TextEditingController _minController;
  late TextEditingController _maxController;
  late TextEditingController _publisherController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _imageController = TextEditingController();
    _titleController = TextEditingController();
    _deadlineController = TextEditingController();
    _minController = TextEditingController();
    _maxController = TextEditingController();
    _publisherController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _titleController.dispose();
    _deadlineController.dispose();
    _minController.dispose();
    _maxController.dispose();
    _publisherController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _deadlineController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }  ItemsController itemsController = Get.find();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: const Text('Add Item' , style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() {
                  if(itemsController.pickedFile.value!=null){
                      return Image.file(File(itemsController.pickedFile.value!.path!));
                  }else{
                    return const Text('no Image Selected');
                  }
                }),
                ElevatedButton(onPressed: (){
                  itemsController.selectFile();
                }, child: const Text('pick a file' , style: TextStyle(
                  color: Colors.white
                ),)),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _deadlineController,
                  decoration: InputDecoration(
                    labelText: 'Deadline',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the deadline';
                    }
                    // You may want to add date validation logic here
                    return null;
                  },
                  readOnly: true,
                ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _minController,
                    decoration: const InputDecoration(labelText: 'Min'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the minimum value';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _maxController,
                    decoration: const InputDecoration(labelText: 'Max'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the maximum value';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(

                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Form is valid, perform action (e.g., save data)
                        if(itemsController.isAdding.value==false && itemsController.pickedFile.value!=null)
                      {  saveItem();}
                      }
                    },
                    child: Obx(() {
                      if(itemsController.isAdding.value){
                        return CircularProgressIndicator();
                      }else{
                        return const Text('Save' , style: TextStyle(
                      color: Colors.white
                    ),);
                      }
                    })
                  ),
                ],
              ),
            ),
          ),
      ),
    );
      
  }

  void saveItem() {
    // Retrieve data from controllers and create ItemModel object
    ItemModel newItem = ItemModel(
      
      image: "",
      title: _titleController.text,
      deadline: DateTime.parse(_deadlineController.text),
      min: int.parse(_minController.text),
      max: int.parse(_maxController.text),
      publisher: '',
      description: _descriptionController.text,
    );

    // Do something with the newItem, e.g., save it to a database
    itemsController.addItem(newItem);
   
  }
}
