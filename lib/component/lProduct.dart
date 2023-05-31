import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_4/model/product.dart';

class LProduct extends StatefulWidget {
  const LProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<LProduct> createState() => _LProductState();
}

class _LProductState extends State<LProduct> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  NetworkImage? _image;
  File? image2;
  String url2 = '';
  Uint8List webImage = Uint8List(8);

  String imageUrl = '';

  List<Product> products = [];
  @override
  // void initState() {
  //   super.initState();
  //   getProducts().then((value) {
  //     products = value;
  //     setState(() {});
  //   });
  // }
  void initState() {
    super.initState();
    // getProducts().then((value) {

    //   products = value;
    getProducts();
    setState(() {});
    // }
    //);
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future getImage() async {
    if (kIsWeb) {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        print('1');

        //////////////////////////////////////
        var f = await image.readAsBytes();
        /////////////////////////////////////

        final tempImage = NetworkImage(image.path);
        print('12');

        print('123');
        setState(() {
          ///////////////////////////////////

          webImage = f;
          image2 = File('a');
          _image = tempImage;
        });

        final ref = FirebaseStorage.instance.ref().child('product/img');
        print('1234');
        await ref.putData(webImage);
        print('12345');
        final url = await ref.getDownloadURL();

        setState(() {
          url2 = url;
        });
        print(url);
      } catch (e) {
        print(e);
      }
    }

    //   FilePickerResult? result = await FilePicker.platform.pickFiles();

    //   if (result != null) {
    //     Uint8List? fileBytes = result.files.first.bytes;
    //     String fileName = result.files.first.name;
    //     // Upload file
    //     await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
    //   }
  }

  // Future<List<Product>> getProducts() async {
  //   final proCollection = await FirebaseFirestore.instance.collection('product').get();
  //   List<Product> newList = [];
  //   print('4');
  //   for (final doc in proCollection.docs) {
  //     final product = Product.fromMap(doc.data());
  //     newList.add(product);
  //   }
  //   return newList;
  // }
  getProducts() async {
    FirebaseFirestore.instance.collection('product').snapshots().listen((collection) {
      List<Product> newList = [];
      print('4');
      for (final doc in collection.docs) {
        final product = Product.fromMap(doc.data());
        newList.add(product);
      }
      products = newList;
      setState(() {});
      //return newList;
    });
  }

  SaveProduct() async {
    try {
      // FilePickerResult? result = await FilePicker.platform.pickFiles();

      // if (result != null) {
      //   Uint8List? fileBytes = result.files.first.bytes;
      //   String fileName = result.files.first.name;
      // }

      // final ref = FirebaseStorage.instance.ref().child('product/${titleController.text}');
      // await ref.putData(webImage);
      // final url = await ref.getDownloadURL();
      // setState(() {
      //   imageUrl = url;
      // });
      //final product = Product(imageUrl: 'webImage}', title: titleController.text, price: priceController.text);
      final product = Product(imageUrl: imageController.text, title: titleController.text, price: priceController.text);
      print('5');
      final productCollection = FirebaseFirestore.instance.collection('product');
      final productDoc = productCollection.doc(product.title);
      productDoc.set(product.toMap());
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
                child: Row(
                  children: const [
                    Text(
                      'Products',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Import',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 200,
                  width: 900,
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'First up: what are you selling?',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          'Before you open your store, first you need some products.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(120, 45),
                            ),
                            child: const Text(
                              'Find products to sell',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: const Color(0xfffafafa),
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Add product',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                        height: 160,
                                        width: 600,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(left: 28),
                                              child: Text(
                                                'Title',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Center(
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                                ),
                                                width: 500,
                                                height: 40,
                                                child: TextField(
                                                    controller: titleController,
                                                    decoration: const InputDecoration(border: OutlineInputBorder()),
                                                    onChanged: (sometext) {
                                                      setState(() {});
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                        height: 120,
                                        width: 600,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(left: 28),
                                              child: Text(
                                                'Media',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xffe5effd),
                                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                                  ),
                                                  width: 80,
                                                  height: 20,
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        await getImage();
                                                      },
                                                      child: const Text(
                                                        'Add file',
                                                        style: TextStyle(color: Color(0xff3851ac)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (__) {
                                                        return Dialog(
                                                          backgroundColor: Colors.white,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(30),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Center(
                                                                  child: Container(
                                                                    decoration: const BoxDecoration(
                                                                      color: Colors.white,
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(4)),
                                                                    ),
                                                                    width: 700,
                                                                    height: 80,
                                                                    child: TextField(
                                                                        controller: imageController,
                                                                        decoration: const InputDecoration(
                                                                            border: OutlineInputBorder()),
                                                                        onChanged: (sometext) {
                                                                          setState(() {});
                                                                        }),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed: () {
                                                                    //final navigator = Navigator.of(context);
                                                                    Navigator.pop(context);
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor: const Color(0xff008060),
                                                                    minimumSize: const Size(60, 40),
                                                                  ),
                                                                  child: const Text('Add URL'),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: const Text(
                                                    'Add from URL',
                                                    style: TextStyle(
                                                        decoration: TextDecoration.underline, color: Color(0xff6495d8)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                        height: 130,
                                        width: 600,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(left: 28),
                                              child: Text(
                                                'Pricing',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 28),
                                              child: Text('Price'),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 28),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                                ),
                                                width: 250,
                                                height: 40,
                                                child: TextField(
                                                    controller: priceController,
                                                    decoration: const InputDecoration(border: OutlineInputBorder()),
                                                    onChanged: (sometext) {
                                                      setState(() {});
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await SaveProduct();

                                            setState(() {});
                                            Navigator.pop(context);
                                            titleController.text = '';
                                            priceController.text = '';
                                            imageController.text = '';
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff008060),
                                            minimumSize: const Size(120, 45),
                                          ),
                                          child: const Text(
                                            'Add your products',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff008060),
                              minimumSize: const Size(120, 45),
                            ),
                            child: const Text(
                              'Add your products',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                // height: 200,
                width: 900,
                decoration:
                    const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          'Product Image',
                          // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Text('Product Name '),
                        SizedBox(
                          width: 200,
                        ),
                        Text('Price '),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    ////for loop
                    for (final product in products)
                      Container(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            // Image.network(
                            //   'https://99designs-blog.imgix.net/blog/wp-content/uploads/2016/12/attachment_89561603-e1513587105243.jpg?auto=format&q=60&fit=max&w=930',
                            //   height: 80,
                            //   width: 80,
                            // ),
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.network(product.imageUrl),
                            ),
                            const SizedBox(
                              width: 220,
                            ),
                            Text(product.title),
                            const SizedBox(
                              width: 200,
                            ),
                            Text(product.price),
                            const SizedBox(
                              width: 50,
                            ),
                            InkWell(
                                onTap: () {
                                  FirebaseFirestore.instance.collection('product').doc(product.title).delete();
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Color(0xff008060),
                                ))
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
