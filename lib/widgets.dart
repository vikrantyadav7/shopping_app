import 'package:flutter/material.dart';

import 'NodeResponses.dart';

class Widgets{
  Widget productList(String category) {
    return FutureBuilder(
      future: readJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<Products>;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return items[index].pCategory == category
                    ? ProductCard(
                  id: index,
                    imgUrl: items[index].pImage!,
                    itemName: items[index].pName!,
                    cost: items[index].pCost.toString(),
                    availability: items[index].pAvailability.toString(),
                    details: items[index].pDetails != null
                        ? items[index].pDetails!
                        : "")
                    : category == "all"
                    ? ProductCard(
                  id: index,
                    imgUrl: items[index].pImage!,
                    itemName: items[index].pName!,
                    cost: items[index].pCost.toString(),
                    availability: items[index].pAvailability.toString(),
                    details: items[index].pDetails != null
                        ? items[index].pDetails!
                        : "")
                    : Container();
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}



class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
        required this.id,
        required this.details,
        required this.availability,
        required this.cost,
        required this.itemName,
        required this.imgUrl})
      : super(key: key);
  final String imgUrl, itemName, cost, availability, details ;
 final int id;
  @override
  _ProductCardState createState() => _ProductCardState();
}
TextEditingController quantityController = TextEditingController();
class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          height: 159,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.network(
                widget.imgUrl,
                width: 150,
                height: 150,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.itemName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text("Rs."+ widget.cost,
                      style: const TextStyle(fontSize: 20, color: Colors.red)),
                  Text('availability:  ' + widget.availability,
                      style: const TextStyle(fontSize: 20)),
                  Text(widget.details, style: const TextStyle(fontSize: 20,color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
          top: 10,
          right: 10,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            tooltip: "Add quantity",
            mini: true,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Please Add the quantity "),
                    content: TextField(
                      controller: quantityController,
                      keyboardType:const TextInputType.numberWithOptions(),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Submit"),
                        onPressed: () {
                          updateJsonData(widget.id ,quantityController.text);
                          Navigator.pop(context);
                          // Navigator.of(context).pop();
                        },
                      )
                    ],
                    elevation: 5,
                  );
                },
              );
            },
          ))
    ]);
  }
}