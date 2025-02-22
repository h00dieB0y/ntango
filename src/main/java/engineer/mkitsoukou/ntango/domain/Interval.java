package engineer.mkitsoukou.ntango.domain;

public record Interval(
    int start,
    int end
) {
  
  @Override
  public String toString() {
    return String.format("[%d, %d]", start, end);
  }
}
