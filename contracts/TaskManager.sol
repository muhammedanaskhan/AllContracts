//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract TaskManager{

    enum TaskStatus{
        Pending,
        Running,
        Completed
    }

    struct Task {
        uint256 id;
        address assignee;
        string title;
        TaskStatus status;
    }

    Task[] private _tasks;

    modifier checkIndexRange(uint taskIndex){
        require(taskIndex < _tasks.length,"Invalid task index");
        _;
    }

    function addTask(string memory _title) external payable{
        require(msg.value > 0.001 ether, "Provide at least 0.001 ether to add a task");

        _tasks.push(
            Task({
                id: _tasks.length,
                assignee: msg.sender,
                title: _title,
                status: TaskStatus.Pending
            })
        );
    }

    function updateTaskStatus(uint _taskIndex, TaskStatus status) external checkIndexRange(_taskIndex){
        require(_tasks[_taskIndex].status != TaskStatus.Completed, "Task is already completed");
        require(msg.sender == _tasks[_taskIndex].assignee, "Only assignee can update the task status");

        _tasks[_taskIndex].status = status;
    }

    funtion getTotalTasksCount()external view returns (uint256){
        return _tasks.length;
    }

    function getRecentThreeTasks()external view returns (memory Task[] ){
        uint256 totalTasks = _tasks.length;
        uint256 count = totalTasks < 3 totalTasks : 3;

        Task[] memory recentTasks = new Task[](count);

        for(uint256 i = 0; i < count; i++ ){
            recentTasks[i] = _tasks[totalTasks - count -i]; // last 3 tasks
        }  

        return recentTasks;
    }

}
