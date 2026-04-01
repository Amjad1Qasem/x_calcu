# PDF Generation and Sharing Guide in Flutter

## Overview
This guide explains how to implement a PDF generation and sharing mechanism in Flutter applications, based on the current app implementation.

## Required Packages

```yaml
dependencies:
  pdf: ^3.10.6
  printing: ^5.11.0
```

## Service Structure

### 1. Main class
```dart
class PdfService {
  /// Generate and share a PDF for selected operations
  static Future<void> generateAndShareOperationsPdf({
    required List<PartnerDetailsOperation> operations,
    required String partnerName,
  }) async
}
```

### 2. Helper methods
- `_buildHeader()` - Build report header
- `_buildOperationCard()` - Build operation card
- `_getOperationTypeColor()` - Determine operation type color

## How It Works

### 1. Create document
```dart
final pdf = pw.Document();
```

### 2. Organize pages
- **First page**: contains the header and the first operation
- **Following pages**: each page contains two operations

### 3. Build content
```dart
pdf.addPage(
  pw.Page(
    pageFormat: PdfPageFormat.a4,
    margin: const pw.EdgeInsets.all(20),
    build: (pw.Context context) {
      return pw.Column(
        children: [
          _buildHeader(partnerName, operations.length),
          _buildOperationCard(operation, operationNumber),
        ],
      );
    },
  ),
);
```

### 4. Share
```dart
await Printing.sharePdf(
  bytes: await pdf.save(),
  filename: 'operations_${DateTime.now().millisecondsSinceEpoch}.pdf',
);
```

## UI Integration

### 1. In `SelectionActionBar`
```dart
Future<void> _handleShare(
  BuildContext context,
  List<PartnerDetailsOperation> selectedItems,
) async {
  try {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Generate and share PDF
    await PdfService.generateAndShareOperationsPdf(
      operations: selectedItems,
      partnerName: partnerName,
    );

    // Close loading indicator
    if (context.mounted) {
      Navigator.of(context).pop();

      // Show success message
      snackBar(
        context: context,
        title: 'PDF generated successfully',
        isErrorMessage: false,
      );
    }
  } catch (e) {
    // Handle errors
    if (context.mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error generating PDF'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
```

## PDF Design

### 1. Header
```dart
static pw.Widget _buildHeader(String partnerName, int operationsCount) {
  return pw.Container(
    width: double.infinity,
    padding: const pw.EdgeInsets.all(20),
    decoration: pw.BoxDecoration(
      color: PdfColors.blue50,
      borderRadius: pw.BorderRadius.circular(10),
      border: pw.Border.all(color: PdfColors.blue200),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Operations Report', style: headerStyle),
        pw.Text('Partner: $partnerName'),
        pw.Text('Total Operations: $operationsCount'),
        pw.Text('Generated: ${DateTime.now()}'),
      ],
    ),
  );
}
```

### 2. Operation card
```dart
static pw.Widget _buildOperationCard(
  PartnerDetailsOperation operation,
  int operationNumber,
) {
  return pw.Container(
    width: double.infinity,
    padding: const pw.EdgeInsets.all(16),
    decoration: pw.BoxDecoration(
      color: PdfColors.grey50,
      borderRadius: pw.BorderRadius.circular(8),
      border: pw.Border.all(color: PdfColors.grey300),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Core operation information
        _buildOperationHeader(operation, operationNumber),

        // Invoice details
        _buildInvoiceDetails(operation),

        // Payment details
        _buildPaymentDetails(operation),

        // Percentage details
        _buildPercentageDetails(operation),

        // Received and remaining amounts
        _buildAmountDetails(operation),

        // Date and notes
        _buildDateAndNotes(operation),
      ],
    ),
  );
}
```

### 3. Dynamic colors
```dart
static PdfColor _getOperationTypeColor(String? operationType) {
  switch (operationType?.toLowerCase()) {
    case 'input':
      return PdfColors.green600;
    case 'output':
      return PdfColors.red600;
    default:
      return PdfColors.grey600;
  }
}
```

## Usage in a New Project

### 1. Add dependencies
```yaml
dependencies:
  pdf: ^3.10.6
  printing: ^5.11.0
```

### 2. Create a generic PDF service
```dart
class PdfService {
  static Future<void> generateAndSharePdf({
    required List<dynamic> data,
    required String title,
    required String filename,
    required pw.Widget Function(dynamic item, int index) itemBuilder,
  }) async {
    try {
      final pdf = pw.Document();

      // Build content
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(20),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildHeader(title, data.length),
                pw.SizedBox(height: 20),
                ...data.asMap().entries.map((entry) {
                  return itemBuilder(entry.value, entry.key);
                }),
              ],
            );
          },
        ),
      );

      // Share file
      await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: filename,
      );
    } catch (e) {
      rethrow;
    }
  }
}
```

### 3. Usage
```dart
await PdfService.generateAndSharePdf(
  data: yourDataList,
  title: 'Your Report Title',
  filename: 'report_${DateTime.now().millisecondsSinceEpoch}.pdf',
  itemBuilder: (item, index) => _buildItemCard(item, index),
);
```

## Features

### 1. Advanced design
- Supports dynamic colors
- Responsive layout
- Advanced text formatting

### 2. Performance
- Comprehensive error handling
- Memory optimization
- Large file support

### 3. Flexibility
- Fully customizable
- Supports different data types
- Ability to add images

## Usage Tips

### 1. Performance optimization
```dart
// Use pagination for large datasets
for (int i = 0; i < data.length; i += itemsPerPage) {
  final pageData = data.skip(i).take(itemsPerPage).toList();
  pdf.addPage(/* build page */);
}
```

### 2. Error handling
```dart
try {
  await PdfService.generateAndShareOperationsPdf(
    operations: operations,
    partnerName: partnerName,
  );
} catch (e) {
  // Handle errors
  print('Error: $e');
  // Show error message to the user
}
```

### 3. Design customization
```dart
// Customize colors
static const PdfColor primaryColor = PdfColors.blue600;
static const PdfColor secondaryColor = PdfColors.grey600;

// Customize fonts
static const pw.TextStyle headerStyle = pw.TextStyle(
  fontSize: 24,
  fontWeight: pw.FontWeight.bold,
  color: primaryColor,
);
```

## Conclusion

This mechanism provides a complete solution for generating and sharing PDF files in Flutter applications with:

- **Ease of use**: simple and clear interface
- **Design flexibility**: fully customizable
- **High performance**: optimized data processing
- **Comprehensive support**: robust error handling and excellent user experience

This approach can be used in any Flutter project that needs PDF generation and sharing.
