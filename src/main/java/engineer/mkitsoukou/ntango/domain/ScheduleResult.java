package engineer.mkitsoukou.ntango.domain;

public record ScheduleResult(
    String taskId,
    int startTime,
    int endTime
) {
  
}
