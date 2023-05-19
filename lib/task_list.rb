class TaskList
    def initialize
        @tasks = []
    end

    def add(task)
        @tasks << task
    end

    def all
        return @tasks
    end
    end