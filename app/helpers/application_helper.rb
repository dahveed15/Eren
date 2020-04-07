module ApplicationHelper
  def exercise_display_text(exercise)
    exercise_string = "#{exercise.sets} sets of #{exercise.reps} reps"
    exercise_string += " at #{exercise.weight_value} #{exercise.units}" unless exercise.bodyweight?
    exercise_string
  end
end
