class TodoList

  def initialize(task1, task2)
    @task1 = task1
    @task2 = task2
  end

  def get_items
    task_list = []
    task_list << @task1
    task_list << @task2
end
