import 'package:ecommerce/components/grid_card.dart';
import 'package:ecommerce/components/loader.dart';
import 'package:ecommerce/models/product.dart';

import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/utils/firestore.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = ["1", "2"];
  Future<List<Product>>? products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = FireStoreUtil.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    onCardPress(Product product) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    product: product,
                  )));
    }

    return FutureBuilder<List<Product>>(
      future: products,
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        print(snapshot.data);
        if (snapshot.hasData && snapshot.data != null) {
          return GridView.builder(
              itemCount: snapshot.data?.length,
              padding: const EdgeInsets.symmetric(vertical: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
              itemBuilder: (BuildContext context, int index) {
                return GridCard(
                    product: snapshot.data![index],
                    index: index,
                    onPress: (() {
                      (snapshot.data![index]);
                    }));
              });
        } else {
          // return Center(
          //   child: Text('rawda'),
          // );
          return Center(child: loader());
        }
      },
    );
  }
}
