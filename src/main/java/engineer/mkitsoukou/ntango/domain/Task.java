package engineer.mkitsoukou.ntango.domain;

public record Task(
    String id,
    int duration,
    int deadline,
    int earliestStart
) {
}
