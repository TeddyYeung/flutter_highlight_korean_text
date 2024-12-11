part of flutter_highlight_korean_text;

// 문자열에서 하이라이트 기능을 제공하는 확장 메소드

extension HighlightedText on String {
  // 주어진 쿼리를 기준으로 하이라이트된 텍스트를 반환
  TextSpan toHighlightedText({
    required String query,
    TextStyle? normalStyle,
    TextStyle? highlightedStyle,
  }) {
    if (query.isEmpty || this.isEmpty) {
      return TextSpan(text: this, style: normalStyle);
    }

    final normalizedQuery = query.removeSpaces().toLowerCase();
    final normalizedText = removeSpaces().toLowerCase();

    final highlightMask = List.filled(normalizedText.length, false);
    final koreanInitials = normalizedText.extractKoreanInitials().toLowerCase();

    // 텍스트에서 query와 일치하는 부분을 찾고 Highlight Mask 설정
    for (final match in normalizedQuery.allMatches(normalizedText)) {
      for (var i = 0; i < normalizedText.length; i++) {
        highlightMask[i] = i >= match.start && i < match.end;
      }
    }

    // 한글 초성을 기준으로 Highlight Mask 설정
    for (final match in normalizedQuery.allMatches(koreanInitials)) {
      for (var i = 0; i < normalizedText.length; i++) {
        highlightMask[i] = i >= match.start && i < match.end;
      }
    }

    final children = <TextSpan>[];
    for (var i = 0; i < length; i++) {
      children.add(TextSpan(
        text: substring(i, i + 1),
        style: highlightMask[i] ? highlightedStyle : normalStyle,
      ));
    }

    return TextSpan(children: children);
  }

  String removeSpaces() {
    return replaceAll(' ', '');
  }
}
