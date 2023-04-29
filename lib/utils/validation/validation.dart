import 'package:reactive_forms/reactive_forms.dart';

const passwordRegEx = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";

final form = FormGroup({
  'username': FormControl<String>(validators: [Validators.required]),
  'email':
      FormControl<String>(validators: [Validators.email, Validators.required]),
  'password': FormControl<String>(
      validators: [Validators.required, Validators.pattern(passwordRegEx, validationMessage: ValidationMessage.pattern)]),
  'comfirmPassword': FormControl<String>(validators: [
    Validators.required,
  ])
}, validators: [
  Validators.mustMatch('password', 'comfirmPassword')
]);