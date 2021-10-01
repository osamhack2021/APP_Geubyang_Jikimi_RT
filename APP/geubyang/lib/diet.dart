class Diet {
  final String dates;
  final String brft;
  final String lunc;
  final String dinr;

  Diet({
    required this.dates,
    required this.brft,
    required this.lunc,
    required this.dinr,
  });

  factory Diet.fromjson(Map<String, dynamic> json) {
    return Diet(
      dates: json['dates'],
      brft: json['brft'],
      lunc: json['lunc'],
      dinr: json['dinr'],
    );
  }
}
