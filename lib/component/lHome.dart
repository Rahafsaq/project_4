import 'package:flutter/material.dart';

class LHome extends StatelessWidget {
  const LHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          width: 700,
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Setup guide',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_up)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Use this personalized to get your store up and running. '),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Row(
                children: const [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Add brand assets'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Customize theme'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Add your first product'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Add custom domain'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Get more with Shopify apps'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
