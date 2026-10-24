import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/vela_logo.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.background,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Profile section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: AppColors.accentLight,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VELA Free',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '42 / 50 actions used this month',
                        style: TextStyle(fontSize: 13, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.accent, Color(0xFFA855F7)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Upgrade',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Settings groups
          _sectionLabel('Preferences'),
          _settingTile(
            Icons.language_rounded,
            'Language',
            'English',
            onTap: () {},
          ),
          _settingTile(
            Icons.schedule_rounded,
            'Morning Briefing',
            'Enabled · 7:00 AM',
            onTap: () {},
          ),
          _settingTile(
            Icons.route_rounded,
            'Default Route',
            'Auto-detect intent',
            onTap: () {},
          ),

          const SizedBox(height: 24),
          _sectionLabel('Privacy & Data'),
          _settingTile(
            Icons.shield_rounded,
            'Privacy Policy',
            'How VELA handles your data',
            onTap: () {},
          ),
          _settingTile(
            Icons.delete_outline_rounded,
            'Delete All Data',
            'Permanently erase everything',
            onTap: () {},
            danger: true,
          ),

          const SizedBox(height: 24),
          _sectionLabel('About'),
          _settingTile(
            Icons.info_outline_rounded,
            'Version',
            '0.1.0 (beta)',
            onTap: () {},
          ),
          _settingTile(
            Icons.open_in_new_rounded,
            'Website',
            'getvela.app',
            onTap: () {},
          ),

          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                const VelaLogo(size: 28),
                const SizedBox(height: 8),
                Text(
                  'Catch every thought. Push every action.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.muted.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: AppColors.muted,
        ),
      ),
    );
  }

  Widget _settingTile(
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
    bool danger = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        leading: Icon(
          icon,
          size: 22,
          color: danger ? AppColors.error : AppColors.muted,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: danger ? AppColors.error : AppColors.foreground,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.muted),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          size: 20,
          color: AppColors.muted,
        ),
      ),
    );
  }
}
