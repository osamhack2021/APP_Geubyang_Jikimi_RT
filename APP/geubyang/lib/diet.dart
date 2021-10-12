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
    try {
      return Diet(
        dates: json['dates'],
        breakfast: json['brst'],
        lunch: json['lunc'],
        dinner: json['dinr'],
      );
    } catch (e) {
      return Diet(
          dates: '0000-00-00', breakfast: '아침', lunch: '점심', dinner: '저녁');
    }
  }
}
