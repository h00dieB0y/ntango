package engineer.mkitsoukou.ntango.domain;

public record Todo(
    String id,
    int duration,
    int deadline,
    int earliestStart
) {
}
