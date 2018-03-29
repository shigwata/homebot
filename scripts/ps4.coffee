# Description:
#   Hubot script to control PlayStation4
#
# Usage:
#   hubot ps4 standby
#   hubot ps4 youtube

{ Device } = require 'ps4-waker'
ps4 = new Device

module.exports = (robot) ->
    robot.respond /ps4\s+(\w+)/i, (res) -> wake res

wake = (res) ->
    cmd = res.match[1].toLowerCase()
    done = -> res.send "PS4 #{cmd}"
    switch cmd
        when 'on', 'start'          then ps4.turnOn()               .then done
        when 'off', 'standby'       then ps4.turnOff()              .then done
        when 'torne', 'tv'          then ps4.startTitle('CUSA00442').then done
        when 'youtube'              then ps4.startTitle('CUSA01065').then done
        when 'amazonvideo', 'video' then ps4.startTitle('CUSA03099').then done
        when 'hulu'                 then ps4.startTitle('CUSA00399').then done
        when 'Twitch'               then ps4.startTitle('CUSA03408').then done
        else                             res.send "unknown command '#{cmd}'"

process.on 'unhandledRejection', console.dir
