import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class ExpandableWidget extends StatefulWidget {
  final Widget beforeExpand;
  final Widget afterExpand;
  final String expandLabel;
  final String collapseLabel;

  const ExpandableWidget({
    super.key,
    required this.beforeExpand,
    required this.afterExpand,
    this.expandLabel = "See More",
    this.collapseLabel = "See Less",
  });

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    bool isArLocale = Localizations.localeOf(context).languageCode == 'ar';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.beforeExpand,
              Row(
                children: [
                  _buildToggleButton(
                    widget.expandLabel,
                    isArLocale
                        ? Icons.keyboard_arrow_left
                        : Icons.keyboard_arrow_right,
                  ),
                ],
              ),
            ],
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.afterExpand,
              _buildToggleButton(widget.collapseLabel, Icons.keyboard_arrow_up),
            ],
          ),
          crossFadeState:
              expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }

  Widget _buildToggleButton(String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp),
              padding: EdgeInsets.all(1.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Utils(context).secondTextColor.withValues(alpha: 0.2),
              ),
              child: Icon(icon, color: Colors.blue, size: 17.sp),
            ),
          ],
        ),
      ),
    );
  }
}
