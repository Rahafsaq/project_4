import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_4/model/customer.dart';

class LCustomer extends StatefulWidget {
  const LCustomer({
    Key? key,
  }) : super(key: key);

  @override
  State<LCustomer> createState() => _LCustomerState();
}

class _LCustomerState extends State<LCustomer> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

  List<Customer> customers = [];
  @override
  void initState() {
    super.initState();
    getCustomer().then((value) {
      customers = value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  // Future<List<Customer>> getCustomer() async {
  //   final customerCollection = await FirebaseFirestore.instance.collection('customer').get();
  //   List<Customer> newList = [];
  //   for (final doc in customerCollection.docs) {
  //     final cusromer = Customer.fromMap(doc.data());
  //     newList.add(cusromer);
  //   }
  //   return newList;
  // }
  getCustomer() async {
    FirebaseFirestore.instance.collection('customer').snapshots().listen((collection) {
      List<Customer> newList = [];
      print('4');
      for (final doc in collection.docs) {
        final product = Customer.fromMap(doc.data());
        newList.add(product);
      }
      customers = newList;
      setState(() {});
      //return newList;
    });
  }

  SaveCustomer() async {
    try {
      final customer =
          Customer(name: nameController.text, email: emailController.text, location: locationController.text);
      print('5');
      final cusCollection = FirebaseFirestore.instance.collection('customer');
      final customerDoc = cusCollection.doc(customer.name);
      customerDoc.set(customer.toMap());
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40),
                child: Row(
                  children: const [
                    Text(
                      'Customers',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  height: 400,
                  width: 900,
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.people_alt_outlined,
                        color: Color(0xff008060),
                        size: 130,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Everything customers-related in a single place',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                            'When you have added customers, you will be able to update their details, get a summary of their order history, create segments to send '),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Center(child: Text('personalized communications that drive sales and more.')),
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
                              minimumSize: const Size(200, 45),
                            ),
                            child: const Text(
                              'Import customers',
                              style: TextStyle(fontSize: 15, color: Colors.black),
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
                                        'Add Customer',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 20,
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
                                                'Name',
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
                                                    controller: nameController,
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
                                                'Email',
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
                                                    controller: emailController,
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
                                                'Location',
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
                                                    controller: locationController,
                                                    decoration: const InputDecoration(border: OutlineInputBorder()),
                                                    onChanged: (sometext) {
                                                      setState(() {});
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await SaveCustomer();
                                            setState(() {});
                                            Navigator.pop(context);
                                            nameController.text = '';
                                            emailController.text = '';
                                            locationController.text = '';
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff008060),
                                            minimumSize: const Size(120, 45),
                                          ),
                                          child: const Text(
                                            'Add customer',
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
                              minimumSize: const Size(200, 45),
                            ),
                            child: const Text(
                              'Add customers',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                //height: 150,
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
                          'Customer Name',
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        Text(' Customer Email '),
                        SizedBox(
                          width: 170,
                        ),
                        Text('Customer Location '),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    for (final customer in customers)
                      Container(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Text(customer.name),
                            const SizedBox(
                              width: 180,
                            ),
                            Text(customer.email),
                            const SizedBox(
                              width: 180,
                            ),
                            Text(customer.location),
                            const SizedBox(
                              width: 50,
                            ),
                            InkWell(
                                onTap: () {
                                  FirebaseFirestore.instance.collection('customer').doc(customer.name).delete();
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Color(0xff008060),
                                ))
                          ],
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
