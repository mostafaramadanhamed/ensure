String formatText(String text) {
  // Replace multiple spaces with a single space and trim leading/trailing spaces
  return text.replaceAll(RegExp(r'\s+'), ' ').trim();
}
