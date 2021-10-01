class Diet {
  final String dates;
  final String brst;
  final String lunc;
  final String dinr;

  Diet({
    required this.dates,
    required this.brst,
    required this.lunc,
    required this.dinr,
  });

  factory Diet.fromjson(Map<String, dynamic> json) {
    try {
      return Diet(
        dates: json['dates'],
        brst: json['brst'],
        lunc: json['lunc'],
        dinr: json['dinr'],
      );
    } catch (e) {
      print(e);
    }

    return Diet(dates: 'dates', brst: 'brst', lunc: 'lunc', dinr: 'dinr');
  }
}
