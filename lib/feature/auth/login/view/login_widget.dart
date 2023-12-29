part of './login_view.dart';

class _EmailTextFieldWidget extends ConsumerWidget {
  const _EmailTextFieldWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthTextField(
      onSaved: (val) {
        if (val == null) return;
        ref.read(userProvider.notifier).setEmail(val);
      },
      validator: (value) => ValidateRegexExtension(value!).isEmail ? null : 'Geçersiz email',
      hintText: 'email',
      icon: Icons.mail,
    );
  }
}

class _PasswordField extends ConsumerWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
        style: Theme.of(context).textTheme.bodyLarge,
        onChanged: (val) {
          if (val.isEmpty) return;
          ref.read(userProvider.notifier).setPassword(val);
        },
        obscureText: true,
        cursorColor: Colors.black,
        validator: (value) => (value != null) && (value.length > 6) ? null : 'En az 6 karakter',
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.brown),
          hintText: 'password',
        ));
  }
}
