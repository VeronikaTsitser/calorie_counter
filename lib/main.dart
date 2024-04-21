import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сегодня'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Добавьте событие нажатия для кнопки настроек
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: const Text('Подсчет калорий'),
                  trailing: const Icon(Icons.add),
                  onTap: () {
                    // Добавьте обработку нажатия
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: const Text('Употребление жидкости'),
                  trailing: const Icon(Icons.add),
                  onTap: () {
                    // Добавьте обработку нажатия
                  },
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ParameterCard(label: 'Вес'),
                  const ParameterCard(label: 'Рост'),
                  const ParameterCard(label: 'Процент жира'),
                  const ParameterCard(label: 'Необходимое количество калорий'),
                  const ParameterCard(label: 'Необходимое количество жидкости'),
                  ElevatedButton(
                    child: const Text('Готово'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text('Статистика'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Всего калорий: 0 ккал'),
                      Text('Всего жидкости: 0 мл'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParameterCard extends StatelessWidget {
  final String label;

  const ParameterCard({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      keyboardType: TextInputType.number,
    );
  }
}
