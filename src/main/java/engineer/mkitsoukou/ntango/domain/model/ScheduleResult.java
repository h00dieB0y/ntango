package engineer.mkitsoukou.ntango.domain.model;

public record ScheduleResult(
    String taskId,
    int startTime,
    int endTime
) {
  
}
