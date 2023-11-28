import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String result = "vazio";
  List<int> numbers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Desafio técnico 1",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insira um número',
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.text.isEmpty) {
                      result = "Campo vazio";
                      numbers.clear();
                    } else {
                      numbers.clear();
                      result =
                          Calculate(int.tryParse(_controller.text)!).toString();
                      _controller.clear();
                    }
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Resultado: $result'),
              SizedBox(height: 10),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      child: Column(
                        children: [
                          Text('${numbers[index]}')
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int Calculate(int value) {
    int count = 0;
    for (int i = 1; i < value; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        count += i;
        numbers.add(i);
      }
    }
    return count;
  }
}
