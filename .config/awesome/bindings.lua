local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("menu")

root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    --{
        awful.key({"Mod1"}, "space", function() awful.spawn("toggle-kb-layout") end,
        {description = "Toggle keyboard layout", group = "Launch"}),
        awful.key({modkey}, "Return", function() awful.spawn(terminal) end,
        {description = "Launch terminal", group = "Launch"}),
        awful.key({modkey}, "p", function() awful.spawn(applauncher_cmd) end,
        {description = "Launch application launcher", group = "Launch"}),
        awful.key({modkey, "Shift"}, "p", function() awful.spawn.with_shell(system_menu_cmd) end,
        {description = "Launch system menu", group = "Launch"}),
        awful.key({modkey, "Shift"}, "q", function() awful.spawn.with_shell(pwr_menu_cmd) end,
        {description = "Launch power menu", group = "Launch"}),
        awful.key({modkey, "Shift"}, "c", function() awful.spawn.with_shell(rofi_calc) end,
        {description = "Launch calculator", group = "Launch"}),
        awful.key({modkey}, "w", function() awful.spawn(wall_picker_cmd) end,
        {description = "Launch wallpaper picker", group = "Launch"}),
        awful.key({modkey, "Mod1"}, "w", function() awful.spawn(wall_random_cmd) end,
        {description = "Change to random wallpaper", group = "Launch"}),
        awful.key({modkey, "Mod1"}, "f", function() awful.spawn(file_xplr_gui_cmd) end,
        {description = "Launch GUI file manager", group = "Launch"}),
        awful.key({modkey, "Shift"}, "f", function() awful.spawn(file_xplr_cli_cmd) end,
        {description = "Launch CLI file manager", group = "Launch"}),
        awful.key({modkey, "Shift"}, "m", function() awful.spawn(msc_plr_cmd) end,
        {description = "Launch music player", group = "Launch"}),
        awful.key({modkey, "Shift"}, "w", function() awful.spawn(browser_cmd) end,
        {description = "Launch browser", group = "Launch"}),
        awful.key({}, "Print", function() awful.spawn.with_shell(printscrn_cmd) end,
        {description = "Take screenshot", group = "Launch"}),
    --}

    --{ MPD
        awful.key({modkey, "Mod1", "Shift" }, "j", function() awful.spawn.with_shell("mpc toggle") end,
        {description = "Toggle Pause", group = "MPD"}),
        awful.key({modkey, "Mod1", "Shift" }, "k", function() awful.spawn.with_shell("mpc stop") end,
        {description = "Stop", group = "MPD"}),
        awful.key({modkey, "Mod1", "Shift" }, "h", function () awful.spawn.with_shell("mpc prev") end,
        {description = "Previous Song", group = "MPD"}),
        awful.key({modkey, "Mod1", "Shift" }, "l", function () awful.spawn.with_shell("mpc next") end,
        {description = "Next Song", group = "MPD"}),
        awful.key({modkey, "Mod1", "Shift" }, ".", function () awful.spawn.with_shell("mpc volume +5") end,
        {description = "Volume +", group = "MPD"}),
        awful.key({modkey, "Mod1", "Shift" }, ",", function () awful.spawn.with_shell("mpc volume -5") end,
        {description = "Volume -", group = "MPD"}),
    --}

    awful.key({ modkey, "Control"          }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "n", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "p", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "Escape", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,           }, "i",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "d",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ "Control", "Mod1" }, "h",     function () awful.layout.set(awful.layout.suit.tile.right) end,
              {description = "set layout to tile", group = "layout"}),
    awful.key({ "Control", "Mod1" }, "j",     function () awful.layout.set(awful.layout.suit.tile.top) end,
              {description = "set layout to tile", group = "layout"}),
    awful.key({ "Control", "Mod1" }, "k",     function () awful.layout.set(awful.layout.suit.tile.bottom) end,
              {description = "set layout to tile", group = "layout"}),
    awful.key({ "Control", "Mod1" }, "l",     function () awful.layout.set(awful.layout.suit.tile.left) end,
              {description = "set layout to tile", group = "layout"}),
    awful.key({ modkey,           }, "s",     function () awful.layout.set(awful.layout.suit.spiral.dwindle) end,
              {description = "set layout to dwindle", group = "layout"}),
    awful.key({ modkey,           }, "m",     function () awful.layout.set(awful.layout.suit.max) end,
              {description = "set layout to max", group = "layout"}),
    awful.key({ modkey,        }, "f",        function () awful.layout.set(awful.layout.suit.floating) end,
              {description = "set layout to floating", group = "layout"}),

    --move floating
    awful.key({ modkey, "Mod1" }, "h", function ()
        client.focus:relative_move(-30, 0, 0, 0)
    end, {description = "move floating window left", group = "client"}),

    awful.key({ modkey, "Mod1" }, "l", function ()
        client.focus:relative_move(30, 0, 0, 0)
    end, {description = "move floating window right", group = "client"}),

    awful.key({ modkey, "Mod1" }, "k", function ()
        client.focus:relative_move(0, -30, 0, 0)
    end, {description = "move floating window up", group = "client"}),

    awful.key({ modkey, "Mod1" }, "j", function ()
        client.focus:relative_move(0, 30, 0, 0)
    end, {description = "move floating window down", group = "client"}),

    --resize floating
    awful.key({ modkey, "Control" }, "h", function ()
            client.focus:relative_move(15, 0, -30, 0)
    end, {description = "shrink floating window horizontally", group = "client"}),

    awful.key({ modkey, "Control" }, "l", function ()
            client.focus:relative_move(-15, 0, 30, 0)
    end, {description = "expand floating window horizontally", group = "client"}),

    awful.key({ modkey, "Control" }, "k", function ()
            client.focus:relative_move(0, 15, 0, -30)
    end, {description = "shrink floating window vertically", group = "client"}),

    awful.key({ modkey, "Control" }, "j", function ()
            client.focus:relative_move(0, -15, 0, 30)
    end, {description = "expand floating window vertically", group = "client"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey,           }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey, "Mod1"          }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "c",
        function()
            local c = client.focus
            if c then
                c.maximized = false
                c.maximized_horizontal = false
                c.maximized_vertical = false
                c.fullscreen = false
                c.floating = false
                c.ontop = false
            end
        end,
        {description = "clear all window state", group = "client"})
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
