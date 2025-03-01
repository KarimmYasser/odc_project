import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/local_db/local_db_helper.dart';
import '../logic/home_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSingleProduct(id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Product Details"),
            ),
            body: ConditionalBuilder(
              condition: context.watch<HomeCubit>().product != null,
              builder: (context) {
                final product = context.watch<HomeCubit>().product!;
                return ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    Text(
                      product.title!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Image.network(product.image!, height: 200),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundColor: Colors.grey, radius: 10),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.black, radius: 10),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.brown, radius: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Product Description",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.description!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Product Related",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.devices, size: 50),
                              SizedBox(height: 10),
                              Text(
                                index == 0
                                    ? "iPad Pro 2020 11”\n128GB"
                                    : "Apple Mac Mini M1\nChip 2020",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                index == 0 ? "\$1029" : "\$878",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {},
                      child: Text("Checkout",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ],
                );
              },
              fallback: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                try {
                  var data = context.read<HomeCubit>().product;
                  await SQLHelper.add(
                      data!.id.toString(),
                      data.title!,
                      data.description ?? "",
                      data.image!,
                      1,
                      data.price!.toDouble());
                } catch (e) {
                  print(e);
                }
              },
              child: Icon(Icons.add_shopping_cart_sharp),
            ),
          );
        },
      ),
    );
  }
}