# README #

This OmniFocus script allows to defer tasks in a smart way. To be precise, it does the following:

- if the task has no defer date, it will deter to tomorrow honouring defer time settings (OmniFocus Preferences)
- if the task has a defer date, it will defer to tomorrow *preserving* time
- if the task has an interval, it will defer according to the interval *preserving* time and day (if applies) and honouring the interval days (if applies)

I do not use due dates in the OmniFocus so your mileague may way. That said, if you run into a bug or an error, please create a new GitHub issue and I will look into it.

The idea behind this script is the following. Every morning, I quickly go over my to-do list in OmniFocus and defer tasks which obviously I won't be to finish (or even start) on that day.

Built-in feature in OmniFocus for deferral (i.e. +1 day/week/month) is great but it has limitations too. For example, interval with specific days is not honoured. In other words, built-in deferral will simply move the defer day forward disregarding any interval (week) days.

### How do I get set up? ###

- copy script to OmniFocus scripts folder
- - *hint:* OmniFocus -> Help (top menu) -> Open Scripts Folder
- right click on OmniFocus toolbar, select customize and drag script's icon on the toolbar

>Special note: in my experience, I had an issue where running the script directly (from script editor) worked fined but inside OmniFocus it would throw an error.

Here's how I solved that issue:

- open defer script with `Script Editor` (right click -> open with -> `Script Editor`)
- inside the editor, press the button on the toolbar called `Compile the Script` (icon looks like a hammer)
- save the script and exit
- inside OmniFocus, *remove* the script's icon in the toolbar and add it *again*

The last step is very important as it seems that without it, the issue would not be solved.

>**Warning** don't forget to set the encoding to `MacRoman` if you are going to edit the script **Warning**
