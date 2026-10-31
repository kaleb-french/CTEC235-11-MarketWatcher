# Journal
Write your Journal questions and notes here.

Phase 1-
The difference is the copyWIth is creating a new object with values given and not changing values on the original object effectively making it immutable.

Phase 2-
The StreamBuilder listens to the stream provided by the bloc, whenever the bloc sends a new stock object it rebuilds the ui with the new data. The difference is setState is how updates are handled and has to be manually called to update, StreamBuilder the stream automatically notifies the widget with new data is sent triggering a rebuild.
