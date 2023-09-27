// ignore_for_file: unused_field

import 'package:ecommerce/components/custom_button.dart';
import 'package:ecommerce/components/listcard.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/utils/application_state.dart';
import 'package:ecommerce/utils/common.dart';
import 'package:ecommerce/utils/custom_theme.dart';
import 'package:ecommerce/utils/firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/loader.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  //final carts = ["1", "2"];
  Future<List<Cart>>? carts;
  bool _checkoutButtonLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carts = FireStoreUtil.getCart(
        Provider.of<ApplicationState>(context, listen: false).user);
  }

  void checkout() async {
    setState(() {
      _checkoutButtonLoading = true;
    });
    String error = await CommonUtil.checkoutFlow(
        Provider.of<ApplicationState>(context, listen: false).user!);

    if (error.isEmpty) {
      CommonUtil.showAlert(context, "Sucess", "Your order is placed");
    } else {
      CommonUtil.showAlert(context, "Alert", error);
    }
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _checkoutButtonLoading = false;
      carts = FireStoreUtil.getCart(
          Provider.of<ApplicationState>(context, listen: false).user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: carts,
      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListCard(
                      cart: snapshot.data![index],
                    );
                  },
                ),
                priceFooter(snapshot.data!),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: CustomButton(
                    text: "CHECKOUT",
                    onPress: checkout,
                    loading: false,
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.data != null && snapshot.data!.isEmpty) {
          return const Center(
            child: Icon(
              Icons.add_shopping_cart_sharp,
              color: CustomTheme.yellow,
              size: 150,
            ),
          );
        }
        return Center(child: loader());
      },
    );
  }

  priceFooter(List<Cart> carts) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustomTheme.gray,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  "Total : ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                Text(
                  "\$ " + FireStoreUtil.getCartTotal(carts).toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
