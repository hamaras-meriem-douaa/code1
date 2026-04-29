import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QuizLayout extends StatelessWidget {
  final String question;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelect;
  final String? onBackRoute;
  final String? onNextRoute;
  final VoidCallback? onContinue;

  // ✅ ADDED (ONLY FIX)
  final VoidCallback? onNext;

  const QuizLayout({
    super.key,
    required this.question,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
    this.onBackRoute,
    this.onNextRoute,
    this.onContinue,
    this.onNext, // ✅ ADDED (ONLY FIX)
  });

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
              // Decorative circles
              Positioned(
                top: 40,
                left: 20,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.pinkLight.withValues(alpha: 0.5),
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
                    color: AppTheme.purple.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppTheme.beige.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Main content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Spacer(),

                    // Question
                    Text(
                      question,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textDark,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    // Options
                    ...options.map((option) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: AnswerOption(
                            label: option,
                            isSelected: selectedOption == option,
                            onTap: () => onSelect(option),
                          ),
                        )),

                    const Spacer(),

                    // Navigation
                    Container(
                      padding: const EdgeInsets.only(top: 24),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppTheme.pinkLight,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          if (onBackRoute != null)
                            Expanded(
                              child: _NavigationButton(
                                label: 'Précédent',
                                icon: Icons.chevron_left,
                                isBack: true,
                                onTap: () => Navigator.pushReplacementNamed(
                                  context,
                                  onBackRoute!,
                                ),
                              ),
                            ),

                          if (onBackRoute != null &&
                              (onNextRoute != null || onContinue != null || onNext != null))
                            const SizedBox(width: 16),

                          if (onNextRoute != null || onContinue != null || onNext != null)
                            Expanded(
                              child: _NavigationButton(
                                label: 'Continuer',
                                icon: Icons.chevron_right,
                                isBack: false,
                                isEnabled: selectedOption != null,
                                onTap: selectedOption != null
                                    ? () {
                                        if (onContinue != null) {
                                          onContinue!();
                                        } else if (onNext != null) {
                                          onNext!(); // ✅ FIX HERE
                                        } else if (onNextRoute != null) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            onNextRoute!,
                                          );
                                        }
                                      }
                                    : null,
                              ),
                            ),
                        ],
                      ),
                    ),
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

class AnswerOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: isSelected ? AppTheme.iconGradient : null,
          color: isSelected ? null : Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.purpleDark : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.pink.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.purpleDark
                      : AppTheme.textLight,
                  width: 2,
                ),
                color: isSelected
                    ? AppTheme.purpleDark
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelected ? AppTheme.textDark : AppTheme.textLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isBack;
  final bool isEnabled;
  final VoidCallback? onTap;

  const _NavigationButton({
    required this.label,
    required this.icon,
    required this.isBack,
    this.isEnabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient:
              isBack ? null : (isEnabled ? AppTheme.buttonGradient : null),
          color: isBack
              ? Colors.white.withValues(alpha: 0.7)
              : (isEnabled
                  ? null
                  : Colors.grey.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(16),
          border: isBack
              ? Border.all(color: AppTheme.pinkLight, width: 1)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isBack)
              Icon(icon, size: 18, color: AppTheme.textLight),
            if (isBack) const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isBack
                    ? AppTheme.textLight
                    : (isEnabled ? Colors.white : Colors.grey),
              ),
            ),
            if (!isBack) const SizedBox(width: 4),
            if (!isBack)
              Icon(
                icon,
                size: 18,
                color: isEnabled ? Colors.white : Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}