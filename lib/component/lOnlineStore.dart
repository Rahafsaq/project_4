import 'package:flutter/material.dart';

class LOnlineStore extends StatelessWidget {
  const LOnlineStore({
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
                padding: const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 20),
                child: Row(
                  children: const [
                    Text(
                      'Themes',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.remove_red_eye_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Text('View your store')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 400,
                width: 900,
                decoration:
                    const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://cdn.shopify.com/screenshots/shopify/3a4baznqy9j6hqcoqrw0oqx1s3awah8-72570011947.shopifypreview.com?height=900&version=c0f18cf571fb89ddf0555b2e7166464c96a97a481f24edb59e315562cb406ef1&width=1160',
                          // width: 350,
                          height: 300,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Image.network(
                          'https://cdn.shopify.com/screenshots/shopify/3a4baznqy9j6hqcoqrw0oqx1s3awah8-72570011947.shopifypreview.com?height=900&version=c0f18cf571fb89ddf0555b2e7166464c96a97a481f24edb59e315562cb406ef1&width=350',
                          // width: 350,
                          height: 300,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff008060),
                        minimumSize: const Size(120, 45),
                      ),
                      child: const Text(
                        'Customize',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 400,
                width: 900,
                decoration:
                    const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular free themes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 280,
                          height: 320,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://cdn.shopify.com/theme-store/zx2c5zmpirbt8e0j4p4smtb1oa2d.jpg',
                                height: 200,
                                width: 280,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Dawn',
                                  style: TextStyle(
                                      color: Color(0xff2596be), fontSize: 16, decoration: TextDecoration.underline),
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('By Shopify'),
                                  ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        minimumSize: const Size(45, 45),
                                      ),
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 280,
                          height: 320,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://cdn.shopify.com/theme-store/69xng5ongse13u5vlxpkdl8hzl6e.jpg',
                                height: 200,
                                width: 280,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Refresh',
                                  style: TextStyle(
                                      color: Color(0xff2596be), fontSize: 16, decoration: TextDecoration.underline),
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('By Shopify'),
                                  ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        minimumSize: const Size(45, 45),
                                      ),
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 280,
                          height: 320,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://cdn.shopify.com/theme-store/c3peyg24s6fbbms3okaxo16z8vxi.jpg',
                                height: 200,
                                width: 280,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Craft',
                                  style: TextStyle(
                                      color: Color(0xff2596be), fontSize: 16, decoration: TextDecoration.underline),
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('By Shopify'),
                                  ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        minimumSize: const Size(45, 45),
                                      ),
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
