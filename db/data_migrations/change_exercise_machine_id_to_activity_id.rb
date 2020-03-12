class ChangeExerciseMachineIdToActivityId

  def self.call
    Exercise.where.not(machine_id: nil).find_each do |exercise|
      activity = Activity.find_by(id: exercise.machine_id)
      activity ? exercise.update!(activity_id: exercise.machine_id) : exercise.destroy!
    end
  end

end
