robot.respond /git (.*)/i, (msg) ->
  arg = msg.match[1]
  @exec = require('child_process').exec
  command = "sudo -u pi sh /home/pi/dev/src/github.com/shigwata/homebot/my_exec/git_cmd.sh #{arg}"
  msg.send "Command: #{command}"
  @exec command, (error, stdout, stderr) ->
    msg.send error if error?
    msg.send stdout if stdout?
    msg.send stderr if stderr?
