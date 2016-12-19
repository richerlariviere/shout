# Shout
Easily send notification to macOS "Notification Center"

**Disclaimer: This is very naive code. Do not use it without having a complete knowledge of the code (which is very simple). I plan to clean the inputs laters. At this moment, the code is only usable for measuring time and output it in a notification.**

## Usage

```bash
# Compile the project
swiftc -o shout main.swift
```
Add this function to your *~/.bash_profile* (do not forget to edit the path/to/shout/program)

```bash
shout() {
  start=$(date "+%s")
  $@
  end=$(date "+%s")
  runtime=$(($end-$start))
  path/to/shout/program/shout $runtime $@
}
```
Refresh *~/.bash_profile*: `source ~/.bash_profile`

```bash
shout <your script>

# Example
shout ping -c 4 google.com
# The notification should appear after that
```
