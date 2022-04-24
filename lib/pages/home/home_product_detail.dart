import 'package:flutter/material.dart';

import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Browser(
              url: widget.product.detailUrl,
              title: widget.product.name,
            ),
          ),
          GestureDetector(
            child: Container(
              height: PFspace.screenH * 0.15,
              child: const Center(
                child: Text("点击申请"),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(23, 71, 86, 76),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Browser(
                    url: widget.product.applyUrl,
                    title: "填写申请",
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
