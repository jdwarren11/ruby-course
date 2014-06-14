
class TM::Task
  attr_reader :pid, :description, :priority, :tid, :created_at
  attr_accessor :status
  
  @@tcounter = 0
  @@task_list = []

  def initialize(pid, description, priority)
    @pid = pid
    @description = description
    @priority = priority
    @created_at = Time.now
    @status = false    
    @tid = @@tcounter
    @@tcounter += 1
    @@task_list << self 
  end

  def self.task_list
    @@task_list
  end

  def complete_task
    @status = true
  end

  def self.mark_complete(id)
    task = @@task_list.find { |t| t.tid == id }
    task.complete_task
  end
end
