import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List/Grid Examples',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("10 List/Grid Layouts")),
      body: ListView(
        children: [
          sectionTitle("1. Basic Vertical ListView"),
          SizedBox(
            height: 150,
            child: ListView(
              children: const [
                ListTile(title: Text("Item 1")),
                ListTile(title: Text("Item 2")),
                ListTile(title: Text("Item 3")),
              ],
            ),
          ),

          sectionTitle("2. Horizontal ListView"),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(width: 100, color: Colors.red),
                Container(width: 100, color: Colors.green),
                Container(width: 100, color: Colors.blue),
              ],
            ),
          ),
          sectionTitle("3. ListView.builder"),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) =>
                  ListTile(title: Text("Dynamic Item $index")),
            ),
          ),
          sectionTitle("4. ListView.separated"),
          SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) =>
                  ListTile(title: Text("Separated Item $index")),
            ),
          ),

          sectionTitle("5. GridView.count"),
          SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Card(
                  color: Colors.blue,
                  child: Center(child: Text("Grid $index")),
                );
              }),
            ),
          ),
          sectionTitle("6. GridView.builder"),
          SizedBox(
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.teal[100 * ((index % 8) + 1)],
                  child: Center(child: Text("Item $index")),
                );
              },
            ),
          ),
          sectionTitle("7. GridView.extent"),
          SizedBox(
            height: 200,
            child: GridView.extent(
              maxCrossAxisExtent: 120,
              children: List.generate(6, (index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.orange,
                  child: Center(child: Text("Tile $index")),
                );
              }),
            ),
          ),

          sectionTitle("8. ListView with Cards"),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.store),
                    title: Text("Store $index"),
                    subtitle: Text("Details about store $index"),
                  ),
                );
              },
            ),
          ),

          sectionTitle("9. GridView with Images"),
          SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Image.network(
                  "https://picsum.photos/200?random=$index",
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
          sectionTitle("10. ListView with ExpansionTiles"),
          SizedBox(
            height: 300,
            child: ListView(
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.store),
                  title: const Text("Store 1"),
                  children: const [
                    ListTile(title: Text("Address: Jamalpur, Bihar")),
                    ListTile(title: Text("Products: 120")),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.store),
                  title: const Text("Store 2"),
                  children: const [
                    ListTile(title: Text("Address: Patna, Bihar")),
                    ListTile(title: Text("Products: 85")),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.store),
                  title: const Text("Store 3"),
                  children: const [
                    ListTile(title: Text("Address: Ranchi, Jharkhand")),
                    ListTile(title: Text("Products: 60")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
