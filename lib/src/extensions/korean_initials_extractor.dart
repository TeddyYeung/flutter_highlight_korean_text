part of flutter_highlight_korean_text;

// 한글 텍스트에서 초성만 추출하는 기능을 제공합니다.
extension KoreanInitialsExtractor on String {
  // 주어진 문자열에서 한글 초성을 추출하여 반환합니다.
  String extractKoreanInitials() {
    const koreanInitialConsonants = <String>[
      'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
    ];

    StringBuffer initialConsonants = StringBuffer();

    for (var i = 0; i < length; i++) {
      int charCode = codeUnitAt(i);

      const hangulStartCode = 0xAC00; // "가"의 유니코드 값
      const hangulEndCode = 0xD7A3; // "힣"의 유니코드 값
      final isHangul = charCode >= hangulStartCode && charCode <= hangulEndCode;
      const middleAndFinalCombinationCount = 21 * 28; // 중성과 종성의 조합 수

      if (isHangul) {
        int syllableIndex = charCode - hangulStartCode;
        int initialConsonantIndex = syllableIndex ~/ middleAndFinalCombinationCount;
        initialConsonants.write(koreanInitialConsonants[initialConsonantIndex]);
      } else {
        initialConsonants.write(this[i]);
      }
    }

    return initialConsonants.toString();
  }
}
