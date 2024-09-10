class AppRegex {
  static bool isValidYearsOfExperience(String input) {
    final RegExp numberRegex = RegExp(r'^[0-9]+$');
    if (numberRegex.hasMatch(input)) {
      int years = int.parse(input);
      if (years >= 0 && years <= 50) {
        return true;
      }
    }
    return false;
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }
}
