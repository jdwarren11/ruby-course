
class TM::Project
  attr_reader :name, :pid 

  @@pcounter = 0
  @@project_list = []

  def initialize(name)
    @name = name
    @pid = @@pcounter
    @@pcounter += 1
    @@project_list << self
  end


  def get_complete_tasks
    complete = TM::Task.task_list.select do |t|
      t.pid == self.pid && t.status == true
    end

    complete.sort_by { |t| t.created_at }
  end

  def get_incomplete_tasks
    incomplete = TM::Task.task_list.select do |t|
      t.pid == self.pid && t.status == false
    end

    incomplete.sort_by { |t| [t.priority, t.created_at] }
  end

  def self.project_list
    @@project_list
  end


end
