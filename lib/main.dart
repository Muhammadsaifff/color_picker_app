import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker App',
      home: ColorPickerScreen(),
    );
  }
}

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color selectedColor = Colors.white;

  void _navigateAndPickColor(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PickColorScreen()),
    );

    if (result != null && result is Color) {
      setState(() {
        selectedColor = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor,
      appBar: AppBar(title: const Text('Color Picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _navigateAndPickColor(context),
          child: const Text('Pick a Color'),
        ),
      ),
    );
  }
}

class PickColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Color')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorButton(color: Colors.red, colorName: 'Red', context: context),
          ColorButton(color: Colors.green, colorName: 'Green', context: context),
          ColorButton(color: Colors.blue, colorName: 'Blue', context: context),
        ],
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final String colorName;
  final BuildContext context;

ColorButton({required this.color, required this.colorName, required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () {
          Navigator.pop(this.context, color);
        },
        child: Text(colorName, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
