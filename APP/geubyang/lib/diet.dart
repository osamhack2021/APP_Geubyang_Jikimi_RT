class Diet {
  final String dates;
  final String breakfast;
  final String lunch;
  final String dinner;

  Diet({
    required this.dates,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  factory Diet.fromjson(Map<String, dynamic> json) {
    return Diet(
      dates: json['dates'],
      breakfast: json['brst'],
      lunch: json['lunc'],
      dinner: json['dinr'],
    );
  }
}
