import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Side Hustle'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Share',
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.teal[50],
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  menuButton(Icons.book, 'Proyectos', () {}),
                  menuButton(Icons.drafts, 'Enviar', () {}),
                  menuButton(Icons.share, 'Compartir', () {}),
                  menuButton(Icons.settings, 'Ajustes', () {}),
                  menuButton(Icons.people, 'Miembros', () {}),
                  menuButton(Icons.add, 'Nuevo', () {}),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return nota('Nota ${index + 1}', Colors.teal[100 * (index + 1)] ?? Colors.teal);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nota(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut urna nec sapien mollis tincidunt.',
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  Widget menuButton(IconData icon, String text, Function onPressed) {
    return TextButton.icon(
      onPressed: () => onPressed(),
      icon: Icon(icon, color: Colors.teal),
      label: Text(
        text,
        style: const TextStyle(color: Colors.teal),
      ),
    );
  }
}
