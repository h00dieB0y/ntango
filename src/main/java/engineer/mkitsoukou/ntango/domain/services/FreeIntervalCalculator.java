package engineer.mkitsoukou.ntango.domain.services;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import engineer.mkitsoukou.ntango.domain.model.FixedTask;
import engineer.mkitsoukou.ntango.domain.model.Interval;

public class FreeIntervalCalculator {
  
    public List<Interval> computeFreeIntervals(List<FixedTask> fixedTasks, int horizonStart, int horizonEnd) {

        if (fixedTasks.isEmpty()) {
            return List.of(new Interval(horizonStart, horizonEnd));
        }

        List<Interval> freeIntervals = new ArrayList<>();

        // Sort the fixed tasks by start time
        fixedTasks.sort(Comparator.comparing(FixedTask::startTime));

        int currentStart = horizonStart;
        for (FixedTask fixedTask : fixedTasks) {
            if (fixedTask.startTime() > currentStart) {
                freeIntervals.add(new Interval(currentStart, fixedTask.startTime()));
            }
            currentStart = fixedTask.endTime();
        }

        if (currentStart < horizonEnd) {
            freeIntervals.add(new Interval(currentStart, horizonEnd));
        }

        return freeIntervals;
    }
}
