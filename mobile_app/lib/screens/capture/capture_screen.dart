import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_colors.dart';

class CaptureScreen extends StatefulWidget {
  final String? sharedText;
  final VoidCallback onClose;

  const CaptureScreen({super.key, this.sharedText, required this.onClose});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  late TextEditingController _controller;
  bool _isProcessing = false;
  bool _isDone = false;
  String? _resultSummary;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.sharedText ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _process() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() => _isProcessing = true);

    // Simulate AI processing
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      _isProcessing = false;
      _isDone = true;
      _resultSummary = _mockResult(_controller.text);
    });
  }

  String _mockResult(String input) {
    final lower = input.toLowerCase();
    if (lower.contains('meeting') || lower.contains('tomorrow') || lower.contains('pm') || lower.contains('am')) {
      return '✓ Event created → Google Calendar';
    }
    if (lower.contains('email') || lower.contains('draft') || lower.contains('send')) {
      return '✓ Email draft created → Gmail';
    }
    if (lower.contains('remind') || lower.contains('alarm')) {
      return '✓ Reminder set → Notifications';
    }
    if (lower.contains('http') || lower.contains('www') || lower.contains('.com')) {
      return '✓ Link saved → Notion';
    }
    return '✓ Note saved → VELA Memory';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: widget.onClose,
        ),
        title: const Text(
          'Capture',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          if (widget.sharedText != null)
            Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.share_rounded, size: 12, color: AppColors.accentLight),
                  SizedBox(width: 4),
                  Text(
                    'Shared',
                    style: TextStyle(fontSize: 11, color: AppColors.accentLight),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isDone) ...[
              _buildResult(),
            ] else ...[
              _buildInput(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What did you capture?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Type, paste, or it\'s already here from a share.',
            style: TextStyle(fontSize: 13, color: AppColors.muted),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              autofocus: widget.sharedText == null,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.foreground,
                height: 1.5,
              ),
              decoration: InputDecoration(
                hintText: 'Meeting with Sarah tomorrow 2pm at Java House...',
                hintStyle: TextStyle(color: AppColors.muted.withValues(alpha: 0.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.accent),
                ),
                filled: true,
                fillColor: AppColors.surface,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Quick action chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _chip(Icons.mic_rounded, 'Voice note'),
                const SizedBox(width: 8),
                _chip(Icons.image_rounded, 'Screenshot'),
                const SizedBox(width: 8),
                _chip(Icons.link_rounded, 'Paste link'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isProcessing ? null : _process,
              child: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.auto_awesome_rounded, size: 18),
                        SizedBox(width: 8),
                        Text('Process with VELA'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 40,
              color: AppColors.success,
            ),
          ).animate().scale(begin: const Offset(0.5, 0.5), end: const Offset(1, 1), duration: 300.ms, curve: Curves.elasticOut),
          const SizedBox(height: 24),
          Text(
            _resultSummary ?? 'Done!',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 8),
          Text(
            '"${_controller.text}"',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.muted,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _isDone = false;
                    _controller.clear();
                  });
                },
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Capture Another'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: widget.onClose,
                child: const Text('Done'),
              ),
            ],
          ).animate().fadeIn(delay: 400.ms),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.muted),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
        ],
      ),
    );
  }
}
