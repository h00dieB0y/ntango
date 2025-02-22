package engineer.mkitsoukou.ntango.domain.model;

import java.util.List;

public record ScheduleRequest(
    List<FixedTask> fixedTasks,
    List<Task> newTasks,
    int horizonStart,
    int horizonEnd
) {
  
    public ScheduleRequest {
        if (horizonStart < 0 || horizonEnd < horizonStart) {
            throw new IllegalArgumentException("Invalid horizon values");
        }
        if (fixedTasks == null || newTasks == null) {
            throw new NullPointerException("Task lists cannot be null");
        }
    }
}
