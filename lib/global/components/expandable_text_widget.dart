import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String? content;

  const ExpandableTextWidget({
    super.key,
    required this.content,
  });

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool expanded = false;
  final int maxLinesToShow = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            const TextStyle textStyle = TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 11.0,
              color: Colors.black,
            );

            return AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.content ?? "",
                    maxLines: maxLinesToShow,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  ),
                  SeeMoreLessWidget(
                    textData: 'رؤية التفاصيل',
                    type: 1,
                    onSeeMoreLessTap: () {
                      setState(() {
                        expanded = true;
                      });
                    },
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.content ?? "",
                    style: textStyle,
                  ),
                  SeeMoreLessWidget(
                    textData: 'اخفاء التفاصيل',
                    type: 2,
                    onSeeMoreLessTap: () {
                      setState(() {
                        expanded = false;
                      });
                    },
                  ),
                ],
              ),
              crossFadeState: expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
      ],
    );
  }
}

class SeeMoreLessWidget extends StatelessWidget {
  final String? textData;
  final int? type;
  final Function? onSeeMoreLessTap;

  const SeeMoreLessWidget({
    super.key,
    required this.textData,
    required this.type,
    required this.onSeeMoreLessTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: InkWell(
          onTap: () {
            if (onSeeMoreLessTap != null) {
              onSeeMoreLessTap!();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textData ?? '',
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0,
                  color: Colors.blue,
                ),
              ),
              Icon(
                type == 1 ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                color: Colors.blue,
                size: 17.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
