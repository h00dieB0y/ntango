package engineer.mkitsoukou.ntango.domain.model;

public record Task(
    String id,
    int duration,
    int deadline,
    int earliestStart
) {
}
