enum OptionTypeCode {
  trafast,
  tracomfort,
  traoptiomal,
  traavoidtoll,
  traavioidcaronly
}

extension on OptionTypeCode {
  String toShortString() {
    return this.toString().split('.').last;
  }
}