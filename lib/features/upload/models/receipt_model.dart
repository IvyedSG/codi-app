class Receipt {
  final String id;
  final String storeName;
  final String date;
  final double total;
  final double co2;
  final bool isGreen;
  final int ecoProductCount;
  final String receiptImagePath;
  final String scannedText;

  Receipt({
    required this.id,
    required this.storeName,
    required this.date,
    required this.total,
    required this.co2,
    required this.isGreen,
    required this.ecoProductCount,
    required this.receiptImagePath,
    required this.scannedText,
  });

  // Método para convertir de JSON a objeto
  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      id: json['id'],
      storeName: json['storeName'],
      date: json['date'],
      total: json['total'].toDouble(),
      co2: json['co2'].toDouble(),
      isGreen: json['isGreen'],
      ecoProductCount: json['ecoProductCount'],
      receiptImagePath: json['receiptImagePath'],
      scannedText: json['scannedText'],
    );
  }

  // Método para convertir de objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeName': storeName,
      'date': date,
      'total': total,
      'co2': co2,
      'isGreen': isGreen,
      'ecoProductCount': ecoProductCount,
      'receiptImagePath': receiptImagePath,
      'scannedText': scannedText,
    };
  }
}