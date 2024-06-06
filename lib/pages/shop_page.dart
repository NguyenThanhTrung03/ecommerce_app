import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/controllers/shop_controller.dart';
import 'package:ecommerce_app/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    //access products in shop

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('TrungApple'),
          actions: [
            //go to cart button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop subtitle
            Center(
              child: Text(
                'Pick from a selected list of premium products',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            //product list
            FutureBuilder(
              future: shopController.getAllProductsFromFirestore(),
              builder: (context, snapshot) => ListenableBuilder(
                  listenable: shopController,
                  builder: (context, snapshot) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 350,
                                    childAspectRatio: 0.6),
                            itemCount: shopController.shop.length,
                            scrollDirection: Axis.vertical,
                            // padding: const EdgeInsets.all(15),
                            itemBuilder: (context, index) {
                              //lay tung san pham rieng le tu cua hang
                              final product = shopController.shop[index];

                              //return as a product title UI
                              return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                  product: product))),
                                  child: MyProductTile(product: product));
                            }),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
