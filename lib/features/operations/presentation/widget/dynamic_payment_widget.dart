import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/operations/data/operation_request_model.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_date_picker_field.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class DynamicPaymentWidget extends StatefulWidget {
  final String title;
  final List<DynamicPaymentItem> items;
  final Function(List<DynamicPaymentItem>) onItemsChanged;
  final bool isReadOnly;

  const DynamicPaymentWidget({
    super.key,
    required this.title,
    required this.items,
    required this.onItemsChanged,
    this.isReadOnly = false,
  });

  @override
  State<DynamicPaymentWidget> createState() => _DynamicPaymentWidgetState();
}

class _DynamicPaymentWidgetState extends State<DynamicPaymentWidget> {
  late List<DynamicPaymentItem> _items;
  final Map<int, TextEditingController> _valueControllers = {};
  final Map<int, TextEditingController> _dateControllers = {};

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _initializeControllers();
  }

  void _initializeControllers() {
    for (int i = 0; i < _items.length; i++) {
      _valueControllers[i] = TextEditingController(
        text: _items[i].invoiceValue,
      );
      _dateControllers[i] = TextEditingController(text: _items[i].invoiceDate);
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (final controller in _valueControllers.values) {
      controller.dispose();
    }
    for (final controller in _dateControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and add button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormLabelWidget(label: widget.title, required: false),
            if (!widget.isReadOnly)
              GestureDetector(
                onTap: _addNewItem,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                    vertical: 6.sp,
                  ),
                  decoration: BoxDecoration(
                    color: Utils(context).secondary,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'add'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        CommonSizes.vSmallestSpace,

        // Items list
        if (_items.isEmpty)
          _buildEmptyState()
        else
          ..._items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildPaymentItem(index, item);
          }),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Text(
        'no_items_added'.tr(),
        style: Utils(context).normalText.copyWith(
          fontWeight: FontWeight.bold,
          color: Utils(context).secondTextColor,
        ),
      ),
    );
  }

  Widget _buildPaymentItem(int index, DynamicPaymentItem item) {
    // Get or create controllers for this index
    if (!_valueControllers.containsKey(index)) {
      _valueControllers[index] = TextEditingController(text: item.invoiceValue);
    }
    if (!_dateControllers.containsKey(index)) {
      _dateControllers[index] = TextEditingController(text: item.invoiceDate);
    }

    final valueController = _valueControllers[index]!;
    final dateController = _dateControllers[index]!;

    return Container(
      margin: EdgeInsets.only(bottom: 12.sp),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Utils(context).backgroundColor,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          // Item header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.title} ${index + 1}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Utils(context).normalText.color,
                ),
              ),
              if (!widget.isReadOnly)
                GestureDetector(
                  onTap: () => _removeItem(index),
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 20.sp,
                  ),
                ),
            ],
          ),
          CommonSizes.vSmallestSpace,

          // Value field
          FormLabelWidget(label: "value", required: false),
          TextFieldApp(
            controller: valueController,
            hintText: '',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            readOnly: widget.isReadOnly,
            enable: !widget.isReadOnly,
            // No validation for dynamic payment fields as they're optional
            onChanged:
                (value) => _updateItem(index, value, dateController.text),
          ),
          CommonSizes.vSmallestSpace,

          // Date field
          FormLabelWidget(label: "date", required: false),
          buildDatePickerField(
            context: context,
            controller: dateController,
            isReadOnly: widget.isReadOnly,
            onDateChanged:
                (date) => _updateItem(index, valueController.text, date),
          ),
        ],
      ),
    );
  }

  void _addNewItem() {
    setState(() {
      final newIndex = _items.length;
      _items.add(DynamicPaymentItem(invoiceValue: '', invoiceDate: ''));
      // Create controllers for the new item
      _valueControllers[newIndex] = TextEditingController();
      _dateControllers[newIndex] = TextEditingController();
    });
    widget.onItemsChanged(_items);
    printSuccess('Added new ${widget.title.toLowerCase()} item');
  }

  void _removeItem(int index) {
    setState(() {
      // Dispose controllers for the removed item
      _valueControllers[index]?.dispose();
      _dateControllers[index]?.dispose();
      _valueControllers.remove(index);
      _dateControllers.remove(index);

      // Shift remaining controllers down
      final keysToUpdate =
          _valueControllers.keys.where((key) => key > index).toList();
      for (final key in keysToUpdate) {
        final valueController = _valueControllers.remove(key);
        final dateController = _dateControllers.remove(key);
        if (valueController != null) {
          _valueControllers[key - 1] = valueController;
        }
        if (dateController != null) {
          _dateControllers[key - 1] = dateController;
        }
      }

      _items.removeAt(index);
    });
    widget.onItemsChanged(_items);
    printSuccess('Removed ${widget.title.toLowerCase()} item at index $index');
  }

  void _updateItem(int index, String value, String date) {
    setState(() {
      _items[index] = DynamicPaymentItem(
        invoiceValue: value,
        invoiceDate: date,
      );
    });
    widget.onItemsChanged(_items);
  }

  // Helper method to get total value
  double getTotalValue() {
    return _items.fold(0.0, (sum, item) {
      return sum + (double.tryParse(item.invoiceValue) ?? 0);
    });
  }
}
