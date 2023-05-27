abstract class SignState {}

class InitSignState extends SignState {}

class ChangeVisableState extends SignState {}

class SigningGoogleState extends SignState {}

class SignInLoadingState extends SignState {}

class SignInSuccessState extends SignState {}

class SignInWithGooglFirstTime extends SignState {}

class SignInWithGooglOld extends SignState {}

class SignInErrorState extends SignState {}

class LogInLoadingState extends SignState {}

class LogInSuccessState extends SignState {}

class LogInErrorState extends SignState {}

class LogoutState extends SignState {}

class GetUserDataSucces extends SignState {}

class PickImageSuccess extends SignState {}

class PickError extends SignState {}

class UploadChatImageError extends SignState {}

class UploadChatImageSuccess extends SignState {}

class UpdateUSerSuccessState extends SignState {}
