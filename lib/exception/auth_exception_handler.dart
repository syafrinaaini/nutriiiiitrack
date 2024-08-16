enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  weakPassword,
  undefined,
}

class AuthExceptionHandler {
  static AuthResultStatus handleException(e) {
    final AuthResultStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "invalid-disabled-field":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "weak-password":
        status = AuthResultStatus.weakPassword;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.successful; // Default case
        break;
    }
    return status;
  }

  static String generateExceptionMessage(AuthResultStatus exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address is invalid";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Your password is wrong";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email does not exist";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later";
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = "Your password is too weak";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with email and password is not enabled";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "An account already exists for that email";
        break;
      default:
        errorMessage = "An undefined error occurred";
        break;
    }
    return errorMessage;
  }
}
