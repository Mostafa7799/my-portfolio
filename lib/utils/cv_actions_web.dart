import 'dart:html' as html;

const _cvPath = 'assets/assets/cv/Mostafa_Mahmoud_Flutter_Developer.pdf';

void openCvInNewTab() {
  html.window.open(_cvPath, '_blank');
}

void downloadCv() {
  final anchor = html.AnchorElement(href: _cvPath)
    ..download = 'Mostafa_Mahmoud_Flutter_Developer.pdf'
    ..style.display = 'none';
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
