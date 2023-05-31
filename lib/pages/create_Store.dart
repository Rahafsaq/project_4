import 'package:flutter/material.dart';
import 'package:project_4/pages/create_Store2.dart';

class CreateStore extends StatelessWidget {
  const CreateStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.white, Color(0xff9cf4d7), Color(0xff94b9f2)]),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: Container(
            height: 550,
            width: 550,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image.network(
                        'data:image/png;base64,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',
                        height: 100,
                        width: 140,
                      ),
                      const SizedBox(
                        width: 300,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xfffdc9d0),
                        ),
                        child: const Center(
                          child: Text(
                            'RA',
                            style: TextStyle(color: Color(0xff773947), fontSize: 15),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                    ],
                  ),
                ),
                // Image.network(
                //   'data:image/png;base64,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',
                //   width: 120,
                //   height: 120,
                // ),
                const Icon(
                  Icons.shopping_bag_rounded,
                  color: Color(0xff008060),
                  size: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Create your first online store',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: Text(
                    'Experiment with different designs and products until you learn what works',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const CreateStore2()),
                        ),
                      );
                    }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff008060),
                      minimumSize: const Size(150, 55),
                    ),
                    child: const Text(
                      'Create store',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
