import 'package:bks_case/view/widgets/show_sheet_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    _firestore.collection('products').doc().get();
    super.initState();
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ürünlerim",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Get.height * 0.02),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            SizedBox(
              height: Get.height * 0.2,
              width: Get.width * 0.8,
              child: InkWell(
                onTap: () {
                  CollectionReference _product =
                      FirebaseFirestore.instance.collection('products');
                  ShowSheetMixin.showCustomSheet(
                      context: context,
                      child: Column(
                        children: [
                          FutureBuilder<DocumentSnapshot>(
                            future: _product.doc("ZH2wGH9hEj3pOer66w6G").get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }

                              if (snapshot.hasData && !snapshot.data!.exists) {
                                return Text("Document does not exist");
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    Text("Ürün Adı: ${data['product_name']}"),
                                    Text("Mac Adresi: ${data['mac_adress']}"),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    InkWell(
                                      onTap: (){},
                                      child: Icon(Icons.heat_pump,size: Get.height * 0.1,))
                                  ],
                                );
                              }

                              return Text("loading");
                            },
                          )
                        ],
                      ),
                      isScrollControlled: false);
                },
                child: Card(
                  child: Image.network(
                      'https://cdn.akakce.com/simfer/simfer-3010-beyaz-set-ustu-z.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.2,
              width: Get.width * 0.8,
              child: InkWell(
                onTap: () {
                  CollectionReference _product =
                      FirebaseFirestore.instance.collection('products');
                  ShowSheetMixin.showCustomSheet(
                      context: context,
                      child: Column(
                        children: [
                          FutureBuilder<DocumentSnapshot>(
                            future: _product.doc("XIdklIIp8UkmxI6Fgwt2").get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }

                              if (snapshot.hasData && !snapshot.data!.exists) {
                                return Text("Document does not exist");
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    Text("Ürün Adı: ${data['product_name']}"),
                                    Text("Mac Adresi: ${data['mac_adress']}"),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.power_settings_new, size: Get.height * 0.1,)),
                                  ],
                                );
                              }

                              return Text("loading");
                            },
                          )
                        ],
                      ),
                      isScrollControlled: false);
                },
                child: Card(
                  child: Image.network(
                      'https://koctas-img.mncdn.com/mnresize/1200/1200/productimages/1000186898/1000186898_1_MC/8801706770482_1564678295533.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
