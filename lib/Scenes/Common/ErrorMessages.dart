enum ErrorMessage {
  titleIsEmpty(
      titleToken: "titleRequiredTitle", messageToken: "titleRequiredMessage");

  final String titleToken;
  final String messageToken;

  const ErrorMessage({required this.titleToken, required this.messageToken});
}
