
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String category = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping App"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      category = "all";
                    });
                  },
                  child: const Text("All"),
                  style: TextButton.styleFrom(
                    primary: category == "all" ? Colors.white : Colors.grey,
                    backgroundColor:
                        category == "all" ? Colors.blue : Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      category = "Premium";
                    });
                  },
                  child: const Text("Premium"),
                  style: TextButton.styleFrom(
                    primary: category == "Premium" ? Colors.white : Colors.grey,
                    backgroundColor:
                        category == "Premium" ? Colors.blue : Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      category = "Tamilnadu";
                    });
                  },
                  child: const Text("Tamilnadu"),
                  style: TextButton.styleFrom(
                    primary:
                        category == "Tamilnadu" ? Colors.white : Colors.grey,
                    backgroundColor:
                        category == "Tamilnadu" ? Colors.blue : Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(child: Widgets().productList(category))
          ],
        ));
  }
}





