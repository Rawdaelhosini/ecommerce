// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/models/product.dart';

import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/utils/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../components/grid_card.dart';
import '../components/loader.dart';
import '../sevices/get_all_product_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? userId = FirebaseAuth.instance.currentUser;
  final data = ["1", "2"];
  Future<List<ProductModel>>? products;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   products = FireStoreUtil.getProducts([]);
  // }

  @override
  Widget build(BuildContext context) {
    onCardPress(ProductModel product) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    product: product,
                  )));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 65),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // عشان اتحكم في شكله
                  crossAxisCount: 2, // ;كام عمود
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60,
                ),
                itemBuilder: (context, index) {
                  return GridCard(
                      index: index,
                      product: products[index],
                      onPress: (() {
                        onCardPress(snapshot.data![index]);
                      }));
                });
          } else {
            return Center(child: loader());
          }
        },
      ),
    );

    // FutureBuilder<List<Product>>(
    //   future: products,
    //   builder: (context, AsyncSnapshot<List<Product>> snapshot) {
    //     print(snapshot.data);
    //     if (snapshot.hasData && snapshot.data != null) {
    //       return GridView.builder(
    //           itemCount: snapshot.data?.length,
    //           padding: const EdgeInsets.symmetric(vertical: 30),
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
    //           itemBuilder: (BuildContext context, int index) {
    //             return GridCard(
    //                 product: snapshot.data![index],
    //                 index: index,
    //                 onPress: (() {
    //                   onCardPress(snapshot.data![index]);
    //                 }));
    //           });
    //     } else {
    //       return Center(child: loader());
    //     }
    //   },
    // );
  }
}
