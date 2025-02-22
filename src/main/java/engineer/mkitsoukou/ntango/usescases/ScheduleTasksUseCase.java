package engineer.mkitsoukou.ntango.usescases;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.IntStream;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.Solution;
import org.chocosolver.solver.variables.IntVar;
import org.springframework.stereotype.Service;

import engineer.mkitsoukou.ntango.domain.ScheduleResult;
import engineer.mkitsoukou.ntango.domain.Task;

@Service
public class ScheduleTasksUseCase {
  
  private static final int MAX_TIME = 100;

  public ScheduleTasksUseCase() {
    // Default constructor.
  }

  public List<ScheduleResult> execute(List<Task> tasks) {
  Objects.requireNonNull(tasks, "todos list must not be null");
  int nbTasks = tasks.size();
  if (nbTasks == 0) {
    return new ArrayList<>();
  }

  Model model = new Model("Todo List Scheduling");

  IntVar[] startTimes = model.intVarArray("startTimes", nbTasks, 0, MAX_TIME, false);
  IntVar[] endTimes = model.intVarArray("endTimes", nbTasks, 0, MAX_TIME, false);

  for (int i = 0; i < nbTasks; i++) {
    Task todo = tasks.get(i);
    model.arithm(endTimes[i], "=", startTimes[i], "+", todo.duration()).post();
    model.arithm(startTimes[i], ">=", todo.earliestStart()).post();
    model.arithm(endTimes[i], "<=", todo.deadline()).post();
  }

  for (int i = 0; i < nbTasks; i++) {
    for (int j = i + 1; j < nbTasks; j++) {
    model.or(
      model.arithm(startTimes[i], ">=", endTimes[j]),
      model.arithm(startTimes[j], ">=", endTimes[i])
    ).post();
    }
  }

  IntVar makespan = model.intVar("makespan", 0, MAX_TIME, false);
  for (int i = 0; i < nbTasks; i++) {
    model.arithm(makespan, ">=", endTimes[i]).post();
  }
  model.setObjective(Model.MINIMIZE, makespan);

  Solution solution = model.getSolver().findOptimalSolution(makespan, Model.MINIMIZE);
  if (solution == null) {
    return new ArrayList<>();
  }

  return IntStream.range(0, nbTasks)
    .parallel()
    .mapToObj(i -> new ScheduleResult(
      tasks.get(i).id(),
      solution.getIntVal(startTimes[i]),
      solution.getIntVal(endTimes[i])
     ))
    .toList();
  }
}