import 'package:flutter/material.dart';

class LDiscount extends StatelessWidget {
  const LDiscount({
    Key? key,
  }) : super(key: key);

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
                  children: [
                    const Text(
                      'Discounts',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Text(
                      'Export',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff008060),
                        minimumSize: const Size(120, 45),
                      ),
                      child: const Text(
                        'Create discount',
                        style: TextStyle(fontSize: 15),
                      ),
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
                  height: 450,
                  width: 900,
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYTgMPeKChCyBttRBqHPs6-ODarWegBz7RdfW_aOsu-MTtwx_4cnd4te6KGbziOIZHgZ0&usqp=CAU',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Manage discounts and promotions',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text('Create discount codes and automatic discounts that apply at '),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('checkout. You can also use discounts with'),
                          SizedBox(
                            width: 2,
                          ),
                          Text('compare at prices.',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ))
                        ],
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff008060),
                          minimumSize: const Size(120, 45),
                        ),
                        child: const Text(
                          'Create discount',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
