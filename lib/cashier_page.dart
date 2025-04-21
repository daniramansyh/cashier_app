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
      "image": "assets/images/cokelat_susu.jpg",
      "quantity": 0,
      "stock": 10,
    },
    {
      "name": "Kacang Goreng",
      "price": 15000,
      "image": "assets/images/kacang_goreng.jpg",
      "quantity": 0,
      "stock": 10,
    },
  ];

  int _totalItem = 0;
  int _totalPrice = 0;

  Future<void> _TambahItemBeli(int index) async {
    setState(() {
      if (products[index]['stock'] > 0) {
        products[index]['stock']--;
        products[index]['quantity']++;
        _totalItem++;
        _totalPrice += products[index]['price'] as int;
      }
    });
  }

  Future<void> _KurangiItemBeli(int index) async {
    setState(() {
      if (products[index]['quantity'] > 0) {
        products[index]['stock']++;
        products[index]['quantity']--;
        _totalItem--;
        _totalPrice -= products[index]['price'] as int;
      }
    });
  }

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
                hintStyle: TextStyle(color: Colors.grey[400]),
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                separatorBuilder:
                    (context, index) => const SizedBox(height: 15),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(products[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                ),
                                color: Colors.grey[400],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${products[index]['name']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Rp ${products[index]['price']}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Stock: ${products[index]['stock']}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              if (products[index]['quantity'] > 0)
                                GestureDetector(
                                  onTap: () => _KurangiItemBeli(index),
                                  child: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: Colors.red[400],
                                    size: 30,
                                  ),
                                ),
                              const SizedBox(width: 10),
                              Text(
                                "${products[index]['quantity']}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => _TambahItemBeli(index),
                                child: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.green[400],
                                  size: 30,
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Item: $_totalItem",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Total Harga: Rp $_totalPrice",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
