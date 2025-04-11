class SlugHelper {
  static String toSlug(String text) {
    return text.toLowerCase().replaceAll(' ', '-');
  }
}