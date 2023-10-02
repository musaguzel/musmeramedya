
import '../init/constants/app/app_constants.dart';

extension StringLocalization on String {
 // String get locale => this.tr();

  String? get isValidEmail => contains(RegExp(ApplicationConstants.EMAIL_REGIEX)) ? null : 'Email does not valid';

  bool get isValidEmails => RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);

  String get getFirst15Words{
    List<String> words = this.split(' ');
    int count = words.length < 15 ? words.length : 15;
    List<String> first20Words = words.sublist(0, count);
    return first20Words.join(' ');
  }
}

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get toPNG => 'assets/images/$this.png';
  String get toMP3 => 'assets/audios/$this.mp3';
}
