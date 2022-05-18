extension StringExtensions on int {
 
  String viewCountToString() {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(0)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(0)}K';
    } else {
      return this.toString();
    }
  }
}
