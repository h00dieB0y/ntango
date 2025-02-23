package engineer.mkitsoukou.ntango.usescases;

import java.util.ArrayList;
import java.util.List;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.variables.IntVar;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import engineer.mkitsoukou.ntango.domain.model.Interval;
import engineer.mkitsoukou.ntango.domain.model.ScheduleRequest;
import engineer.mkitsoukou.ntango.domain.model.ScheduleResult;
import engineer.mkitsoukou.ntango.domain.model.Task;
import engineer.mkitsoukou.ntango.domain.services.FreeIntervalCalculator;

@Service
public class ScheduleTasksUseCase {

  private static final Logger logger = LoggerFactory.getLogger(ScheduleTasksUseCase.class);

  private final FreeIntervalCalculator freeIntervalCalculator;

  public ScheduleTasksUseCase(FreeIntervalCalculator freeIntervalCalculator) {
    this.freeIntervalCalculator = freeIntervalCalculator;
  }

  public List<ScheduleResult> execute(ScheduleRequest request) {
    // Compute free intervals based on fixed tasks and planning horizon.
    List<Interval> freeIntervals = freeIntervalCalculator.computeFreeIntervals(
        request.fixedTasks(), request.horizonStart(), request.horizonEnd());

    List<Task> tasks = request.newTasks();
    int taskCount = tasks.size();
    Model model = new Model("Choco Scheduling with Free Intervals");

    IntVar[] startVars = new IntVar[taskCount];
    IntVar[] endVars = new IntVar[taskCount];

    for (int i = 0; i < taskCount; i++) {
      Task task = tasks.get(i);
      int[] allowedStartValues = computeAllowedStartValues(task, freeIntervals);

      if (allowedStartValues.length == 0) {
        logger.warn("Task {} has no allowed start times.", task.id());
        return List.of();
      }

      startVars[i] = model.intVar("start_" + task.id(), allowedStartValues);
      int minEnd = task.earliestStart() + task.duration();
      endVars[i] = model.intVar("end_" + task.id(), minEnd, task.deadline());
      model.arithm(endVars[i], "=", startVars[i], "+", task.duration()).post();
    }

    addNonOverlapConstraints(model, startVars, endVars, taskCount);

    List<ScheduleResult> results = new ArrayList<>();
    if (model.getSolver().solve()) {
      for (int i = 0; i < taskCount; i++) {
        results.add(new ScheduleResult(
            tasks.get(i).id(),
            startVars[i].getValue(),
            endVars[i].getValue()
        ));
      }
    } else {
      logger.info("No feasible schedule found.");
    }
    return results;
  }

  /**
   * Computes the allowed start times for a task given the free intervals.
   */
  private int[] computeAllowedStartValues(Task task, List<Interval> freeIntervals) {
    List<Integer> allowedValues = new ArrayList<>();
    for (Interval freeInterval : freeIntervals) {
      int startCandidate = Math.max(task.earliestStart(), freeInterval.start());
      int endCandidate = Math.min(task.deadline() - task.duration(), freeInterval.end() - task.duration());
      if (startCandidate <= endCandidate) {
        for (int t = startCandidate; t <= endCandidate; t++) {
          allowedValues.add(t);
        }
      }
    }
    return allowedValues.stream().mapToInt(Integer::intValue).toArray();
  }

  /**
   * Adds the non-overlap constraints between each pair of new tasks.
   */
  private void addNonOverlapConstraints(Model model, IntVar[] startVars, IntVar[] endVars, int taskCount) {
    for (int i = 0; i < taskCount; i++) {
      for (int j = i + 1; j < taskCount; j++) {
        model.or(
            model.arithm(endVars[i], "<=", startVars[j]),
            model.arithm(endVars[j], "<=", startVars[i])
        ).post();
      }
    }
  }
}