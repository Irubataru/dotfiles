X related setup and configuration
=================================

For automatically locking on sleep we need to set the `XDG_SEAT_PATH` in the
service file. Usually the seat should be `Seat0`, but this can vary from system
to system. To get a list of seats run the following

```sh
dm-tool list-seats
```
