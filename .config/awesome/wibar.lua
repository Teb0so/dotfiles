local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ workspaces[1], workspaces[2], workspaces[3], workspaces[4], workspaces[5], workspaces[6], workspaces[7], workspaces[8], workspaces[9], }, s, awful.layout.layouts[1])
--{ custom battery
    local custom_battery = wibox.widget {
        widget = wibox.widget.textbox,
        align = "center",
        valign = "center"
    }

    awful.widget.watch(
        '/home/teb0so/.local/bin/battery',
        5,
        function(widget, stdout)
            widget.text = stdout:gsub("\n", "")
        end,
        custom_battery
    )
--}
--{ custom clock
    local custom_clock = wibox.widget {
        widget = wibox.widget.textbox,
        align = "center",
        valign = "center"
    }

    awful.widget.watch(
        'sh -c \'echo "「  " && date "+%a %d %b |   %H:%M:%S" && echo "」"\'',
        1,
        function(widget, stdout)
            widget.text = stdout:gsub("\n", "")
        end,
        custom_clock
    )
--}
--{ custom cpu and ram
    local custom_pc_monitor = wibox.widget {
        widget = wibox.widget.textbox,
        align = "center",
        valign = "center"
    }

    awful.widget.watch(
        [[sh -c 'echo "「" && echo "  $(top -bn1 | grep "Cpu(s)" | awk '"'"'{print $2 + $4}'"'"')% |   $(free -m | awk '"'"'/Mem:/ { printf("%.1f%%", $3/$2*100) }'"'"')" && echo "」"']],
        5,
        function(widget, stdout)
            widget.text = stdout:gsub("\n", "")
        end,
        custom_pc_monitor
    )
--}
--{ custom net
    local custom_net_widget = wibox.widget {
        widget = wibox.widget.textbox,
        align = "center",
        valign = "center"
    }

    awful.widget.watch(
        [[sh -c 'echo "「" && ping -c1 -W1 1.1.1.1 > /dev/null 2>&1 && echo 󰖟 || echo 󰕑 && echo " 」"' ]],
        3,
        function(widget, stdout)
            widget.text = stdout:gsub("\n", "")
        end,
        custom_net_widget
    )
--}
--{ custom mpd
    local custom_mpd = wibox.widget {
        widget = wibox.widget.textbox,
        align = "center",
        valign = "center"
    }

    awful.widget.watch(
        [[sh -c 'echo "「  " && mpc --format "%artist% - %title%" current && echo "」"']],
        3,
        function(widget, stdout)
            widget.text = stdout:gsub("\n", "")
        end,
        custom_mpd
    )
--}

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout  = {
            layout = wibox.layout.flex.horizontal,
        },
        widget_template = {
            {
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                left  = 4,
                right = 4,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mylayoutbox,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            custom_battery,
            custom_mpd,
            custom_net_widget,
            custom_pc_monitor,
            custom_clock,
            wibox.widget.systray(),
        },
    }
end)
