import 'package:flutter/material.dart';

class LOrder extends StatelessWidget {
  const LOrder({
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
                padding: const EdgeInsets.only(left: 40, top: 40),
                child: Row(
                  children: const [
                    Text(
                      'Orders',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: 900,
                decoration:
                    const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          'Order Number',
                          // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text('Customer ID '),
                        SizedBox(
                          width: 150,
                        ),
                        Text(' Items '),
                        SizedBox(
                          width: 150,
                        ),
                        Text('Total '),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 95,
                        ),
                        const Text('1'),
                        const SizedBox(
                          width: 220,
                        ),
                        const Text('111'),
                        const SizedBox(
                          width: 165,
                        ),
                        Image.network(
                          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2016/12/attachment_89561603-e1513587105243.jpg?auto=format&q=60&fit=max&w=930',
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        const Text('SAR 350'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
