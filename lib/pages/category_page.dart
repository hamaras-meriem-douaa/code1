import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CategoryItem {
  final String id;
  final String name;
  final String route;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.route,
  });
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static const List<CategoryItem> categories = [
    CategoryItem(
      id: 'personality',
      name: 'Personnalité',
      route: '/personality/1',
    ),
    CategoryItem(
      id: 'mood',
      name: 'Humeur',
      route: '/mood/1',
    ),
    CategoryItem(
      id: 'memory',
      name: 'Souvenir',
      route: '/memory/1',
    ),
    CategoryItem(
      id: 'event',
      name: 'Évènement',
      route: '/event/1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Cercles décoratifs
              Positioned(
                top: 40,
                left: 20,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.pinkLight.withValues(alpha:0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                right: 20,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppTheme.purple.withValues(alpha:0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Contenu principal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    const Text(
                      'Choisissez une catégorie',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.textDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Quelle approche vous convient le mieux ?',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Grille des boutons sans icônes
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 3.0, // boutons plus allongés
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return _CategoryButton(category: category);
                        },
                      ),
                    ),

                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        '← Retour',
                        style: TextStyle(
                          color: AppTheme.textLight,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryItem category;

  const _CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, category.route),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppTheme.pinkLight.withValues(alpha:0.7), // fond rose clair
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.pinkLight,
            width: 1,
          ),
        ),
        child: Text(
          category.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppTheme.textDark,
          ),
        ),
      ),
    );
  }
}