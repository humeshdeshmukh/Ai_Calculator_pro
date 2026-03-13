import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ai_calculator_pro/core/theme/app_colors.dart';
import 'package:ai_calculator_pro/core/theme/theme_provider.dart';

class NavigationIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

final navigationIndexProvider = NotifierProvider<NavigationIndexNotifier, int>(() {
  return NavigationIndexNotifier();
});

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);
    final themeSettings = ref.watch(themeProvider);
    final primaryColor = AppColors.themeColors[themeSettings.primaryColorIndex];

    return Scaffold(
      drawer: const CalculatorMenuDrawer(),
      body: Column(
        children: [
          // HEADER
          HeaderBar(primaryColor: primaryColor),

          // MAIN CONTENT
          Expanded(
            child: _getScreen(selectedIndex),
          ),

          // FOOTER
          FooterBar(selectedIndex: selectedIndex),
        ],
      ),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return _PlaceholderPage(
          title: "Home",
          icon: LucideIcons.home,
          info: "Swipeable Calculator Carousel placeholder",
        );
      case 1:
        return _PlaceholderPage(
          title: "AI Assistant",
          icon: LucideIcons.bot,
          info: "Gemini AI explanation placeholder",
        );
      case 2:
        return _PlaceholderPage(
          title: "History",
          icon: LucideIcons.history,
          info: "Calculation history list placeholder",
        );
      case 3:
        return const SettingsPlaceholder();
      default:
        return const Center(child: Text("Unknown Screen"));
    }
  }
}

class HeaderBar extends StatelessWidget {
  final Color primaryColor;
  const HeaderBar({super.key, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 100, // Increased height for premium feel
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(LucideIcons.menu, size: 28),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _HeaderActionButton(icon: LucideIcons.globe, onTap: () {}),
                const SizedBox(width: 8),
                _HeaderActionButton(icon: LucideIcons.mic, onTap: () {}, isSpecial: true, color: primaryColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isSpecial;
  final Color? color;

  const _HeaderActionButton({
    required this.icon,
    required this.onTap,
    this.isSpecial = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSpecial ? color?.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSpecial ? color!.withOpacity(0.5) : Colors.grey.withOpacity(0.2),
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: isSpecial ? color : null, size: 20),
        onPressed: onTap,
      ),
    );
  }
}

class FooterBar extends ConsumerWidget {
  final int selectedIndex;
  const FooterBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _FooterItem(
            icon: LucideIcons.home,
            label: "Home",
            isSelected: selectedIndex == 0,
            color: AppColors.primaryGold,
            onTap: () => ref.read(navigationIndexProvider.notifier).setIndex(0),
          ),
          _FooterItem(
            icon: LucideIcons.bot,
            label: "AI",
            isSelected: selectedIndex == 1,
            color: AppColors.primaryPurple,
            onTap: () => ref.read(navigationIndexProvider.notifier).setIndex(1),
          ),
          _FooterItem(
            icon: LucideIcons.history,
            label: "History",
            isSelected: selectedIndex == 2,
            color: AppColors.primaryBlue,
            onTap: () => ref.read(navigationIndexProvider.notifier).setIndex(2),
          ),
          _FooterItem(
            icon: LucideIcons.settings,
            label: "Settings",
            isSelected: selectedIndex == 3,
            color: AppColors.primaryGray,
            onTap: () => ref.read(navigationIndexProvider.notifier).setIndex(3),
          ),
        ],
      ),
    );
  }
}

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _FooterItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? color : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? color : Colors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorMenuDrawer extends StatelessWidget {
  const CalculatorMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final calculators = [
      ("Simple", LucideIcons.calculator),
      ("EMI/Loan", LucideIcons.banknote),
      ("GST/VAT", LucideIcons.percent),
      ("Age", LucideIcons.calendar),
      ("Salary Tax", LucideIcons.briefcase),
      ("Unit Converter", LucideIcons.ruler),
      ("Currency", LucideIcons.coins),
      ("Fuel Cost", LucideIcons.fuel),
      ("Paint Area", LucideIcons.paintBucket),
      ("BMI", LucideIcons.heartPulse),
      ("Retirement", LucideIcons.palmtree),
      ("Gold/Silver", LucideIcons.gem),
      ("Electrical", LucideIcons.zap),
      ("Crypto", LucideIcons.bitcoin),
      ("Tip", LucideIcons.wallet),
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryGold, AppColors.primaryGold.withOpacity(0.5)],
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.calculator, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    "AI Calculator Pro",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: calculators.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(calculators[index].$2),
                  title: Text(calculators[index].$1),
                  onTap: () => Navigator.pop(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String info;

  const _PlaceholderPage({required this.title, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.grey.withOpacity(0.3)),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(info, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class SettingsPlaceholder extends ConsumerWidget {
  const SettingsPlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Theme Mode", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SegmentedButton<ThemeMode>(
          segments: const [
            ButtonSegment(value: ThemeMode.light, label: Text("Light"), icon: Icon(LucideIcons.sun)),
            ButtonSegment(value: ThemeMode.dark, label: Text("Dark"), icon: Icon(LucideIcons.moon)),
            ButtonSegment(value: ThemeMode.system, label: Text("System"), icon: Icon(LucideIcons.monitor)),
          ],
          selected: {themeSettings.themeMode},
          onSelectionChanged: (value) => ref.read(themeProvider.notifier).setThemeMode(value.first),
        ),
        const SizedBox(height: 24),
        const Text("Theme Color", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(AppColors.themeColors.length, (index) {
            return GestureDetector(
              onTap: () => ref.read(themeProvider.notifier).setPrimaryColorIndex(index),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.themeColors[index],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: themeSettings.primaryColorIndex == index ? Colors.white : Colors.transparent,
                    width: 3,
                  ),
                  boxShadow: [
                    if (themeSettings.primaryColorIndex == index)
                      BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
