import 'package:flutter/material.dart';

class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Coklat Susu",
      "price": 10000,
      "image": "assets/images/coklat_susu.jpg",
    },
    {
      "name": "Permen Karet",
      "price": 5000,
      "image": "assets/images/permen_karet.jpg",
    },
    {
      "name": "Kacang Goreng",
      "price": 15000,
      "image": "assets/images/kacang_goreng.jpg",
    },
  ];
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cashier App",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
            ),
            const Text(
              "Semoga harimu menyenangkan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Cari produk....",
                hintStyle: TextStyle(color: Colors.grey[300]),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            ),
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Coklat Susu",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Rp. 10.000",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
