

  bool isNumeric(String string) {
    if (string.isEmpty) return false;

    final numeric = num.tryParse(string);

    return (numeric == null) ? false : true;
  }
