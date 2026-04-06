import 'package:flutter/material.dart';
import '../theme.dart';

class SustainabilityCard extends StatelessWidget {
  final int itemsDiverted;
  final double moneySaved;
  final double co2Saved;

  const SustainabilityCard({
    super.key,
    required this.itemsDiverted,
    required this.moneySaved,
    required this.co2Saved,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.eco_rounded,
                  color: AppColors.success,
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Your Impact',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _StatCell(
                  icon: Icons.recycling_rounded,
                  iconColor: AppColors.success,
                  value: '$itemsDiverted',
                  label: 'Items\nDiverted',
                ),
                _Divider(),
                _StatCell(
                  icon: Icons.savings_rounded,
                  iconColor: AppColors.warning,
                  value: '\$${moneySaved.toStringAsFixed(0)}',
                  label: 'Money\nSaved',
                ),
                _Divider(),
                _StatCell(
                  icon: Icons.cloud_off_rounded,
                  iconColor: AppColors.secondary,
                  value: '${co2Saved.toStringAsFixed(0)}kg',
                  label: 'CO\u2082\nDiverted',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCell({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 56,
      color: AppColors.border,
    );
  }
}
