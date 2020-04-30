module ApplicationHelper
  def exercise_display_text(exercise)
    exercise_string = "#{exercise.sets} sets of #{exercise.reps} reps"
    exercise_string += " at #{exercise.weight_value} #{exercise.units}" unless exercise.bodyweight?
    if time_fields_present?(exercise)
      exercise_string += " for "
      exercise_string += "#{time_display(exercise.hours)}:"
      exercise_string += "#{time_display(exercise.minutes)}:"
      exercise_string += "#{time_display(exercise.seconds)}"
    end
    exercise_string
  end

  def time_display(time_unit_value)
    return '00' if time_unit_value.nil?
    time_unit_value < 10 ? "0#{time_unit_value}" : "#{time_unit_value}"
  end

  def time_fields_present?(exercise)
    exercise.hours.present? || exercise.minutes.present? || exercise.seconds.present?
  end
end
