# en2he

This is an AHK script that triggers on `Win + Alt + Space`. The script detects the current keyboard language setting, converts the text from that language to the other. It also changes the selected keyboard language for you.

## 📑 Notes:

- The script uses the clipboard to get the selected text and replace it with the converted text. This shouldn't affect your workflow, the script restores the clipboard with the previously copied text. But if you have previously copied a file or any other rich content - it might be corrupted.
- The script was tested on Windows 10 device.
- Currently, the script only supports English and Hebrew (codes - `0x0409` and `0x040D`), it is not too complicated to add different language support, feel free to edit the script.
- The code doesn't connect to any remote server, your data stays on your device. You can have a look at the source code to verify it.

## 🐱‍👤 Getting Started

- There is a compiled executable file you can run, and a `.ahk` file you can edit, run, and play with, after installing AutoHotKey.
- To make the script run on startup click `Win + R` and type `shell:startup`. You can put the script or a link to it in the folder that opened.
- If you want to stop the script, right-click the icon with the letter `H` on the bottom left of the taskbar (it might be in the group of hidden icons), and then select `Exit`.