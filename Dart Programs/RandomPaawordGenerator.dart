import 'dart:math';

String generateRandomPassword(int length) {
  if (length < 4) {
    throw ArgumentError("Password length must be at least 4");
  }

  const String lowercase = "abcdefghijklmnopqrstuvwxyz";
  const String uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const String digits = "0123456789";
  const String specialChars = "!@#%^&*()-_+=";

  final random = Random();
  var password = StringBuffer();

  // Ensure at least one uppercase letter
  password.write(uppercase[random.nextInt(uppercase.length)]);

  // Ensure at least one numerical digit
  password.write(digits[random.nextInt(digits.length)]);

  // Ensure exactly one special character
  password.write(specialChars[random.nextInt(specialChars.length)]);

  for (int i = 3; i < length; i++) {
    final randomType =
        random.nextInt(3); // 0: lowercase, 1: uppercase, 2: digit
    switch (randomType) {
      case 0:
        password.write(lowercase[random.nextInt(lowercase.length)]);
        break;
      case 1:
        password.write(uppercase[random.nextInt(uppercase.length)]);
        break;
      case 2:
        password.write(digits[random.nextInt(digits.length)]);
        break;
    }
  }

  // Shuffle the password to randomize character positions
  final shuffledPassword = password.toString().split('')..shuffle();
  return shuffledPassword.join();
}

void main() {
  // Example: Generate a random password of length 12
  final password = generateRandomPassword(12);
  print("Random Password: $password");
}
