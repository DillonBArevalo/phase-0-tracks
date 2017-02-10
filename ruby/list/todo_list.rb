class TodoList

  def initialize(tasks)
    @list = tasks
  end

  def get_items
    @list
  end

  def add_item(item)
    @list << item
    @list    
  end

  def delete_item(item)
  end

  def get_item(item)
  end

end

