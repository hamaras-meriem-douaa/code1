import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AllergiesPage extends StatefulWidget {
  const AllergiesPage({super.key});

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  final Map<String, bool> allergies = {
    "Huile de rose": false,
    "Huile de menthe": false,
    "Peau sensible": false,
    "Problème(s) respiratoire(s)": false,
    "Grossesse": false,
  };  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Allergies"),
        backgroundColor: AppTheme.pinkLight,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Avez-vous des allergies ?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textDark,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: allergies.keys.map((key) {
                    return CheckboxListTile(
                      value: allergies[key],
                      onChanged: (value) {
                        setState(() {
                          allergies[key] = value!;
                        });
                      },
                      title: Text(key),
                      activeColor: AppTheme.purple,
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/category');
                },
                child: const Text("Continuer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}