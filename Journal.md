# Journal
Write your Journal questions and notes here.

Phase 1-
The difference is the copyWIth is creating a new object with values given and not changing values on the original object effectively making it immutable.

Phase 2-
The StreamBuilder listens to the stream provided by the bloc, whenever the bloc sends a new stock object it rebuilds the ui with the new data. The difference is setState is how updates are handled and has to be manually called to update, StreamBuilder the stream automatically notifies the widget with new data is sent triggering a rebuild.

Phase 3-
The onPress adds a event to the input sink of the Bloc passing an enum value into it. The bloc creates a new copy of Stock object with the new data base on the enum it received. This new object is returned via the output stream which the StreamBuilder is listen to via its stream field, this queues a call to its builder method to rebuild.
