import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/captured_action.dart';
import '../../../theme/app_colors.dart';

class ActionCard extends StatelessWidget {
  final CapturedAction action;
  final VoidCallback? onTap;

  const ActionCard({super.key, required this.action, this.onTap});

  IconData get _typeIcon {
    switch (action.type) {
      case ActionType.createEvent:
        return Icons.calendar_today_rounded;
      case ActionType.setReminder:
        return Icons.notifications_rounded;
      case ActionType.setAlarm:
        return Icons.alarm_rounded;
      case ActionType.draftEmail:
        return Icons.email_rounded;
      case ActionType.saveNote:
        return Icons.note_rounded;
      case ActionType.saveLink:
        return Icons.link_rounded;
      case ActionType.createTask:
        return Icons.task_alt_rounded;
      case ActionType.expenseLog:
        return Icons.receipt_long_rounded;
      case ActionType.unknown:
        return Icons.pending_rounded;
    }
  }

  Color get _statusColor {
    switch (action.status) {
      case ActionStatus.pending:
        return AppColors.warning;
      case ActionStatus.processing:
        return AppColors.accentLight;
      case ActionStatus.completed:
        return AppColors.success;
      case ActionStatus.failed:
        return AppColors.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(_typeIcon, size: 20, color: AppColors.accentLight),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        action.typeLabel,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                      if (action.destination != null)
                        Text(
                          '→ ${action.destination}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        action.statusLabel,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: _statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              action.summary ?? action.rawInput,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.muted,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              _formatTime(action.createdAt),
              style: TextStyle(
                fontSize: 11,
                color: AppColors.muted.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return DateFormat('MMM d, h:mm a').format(dt);
  }
}
