package engineer.mkitsoukou.ntango.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import engineer.mkitsoukou.ntango.domain.ScheduleResult;
import engineer.mkitsoukou.ntango.domain.Todo;
import engineer.mkitsoukou.ntango.usescases.ScheduleTasksUseCase;

@RestController
@RequestMapping("/api/schedule")
public class SchedulingController {
  
  private final ScheduleTasksUseCase scheduleTasksUseCase;

  public SchedulingController(ScheduleTasksUseCase scheduleTasksUseCase) {
    this.scheduleTasksUseCase = scheduleTasksUseCase;
  }

  @PostMapping
  public List<ScheduleResult> scheduleTasks(@RequestBody List<Todo> tasks) {
    return scheduleTasksUseCase.execute(tasks);
  } 
}
