gearman-scout-plugins
=====================

Plugins to monitor the [Gearman Job Server](http://gearman.org/) within [Scout](http://scoutapp.com).

- __gearman_task__ 
records the number of jobs, number of jobs running, and the number of workers for a task.
```
scout test gearman_backlog.rb host=localhost port=4730 task=mytaskname
```

If you have less than 20 tasks (Scout's limit on metrics per plugin), you can install:
- __gearman_backlog__ records the number of jobs for each task that are waiting for a worker.
- __gearman_workers__ records the number of workers assigned for each task.
