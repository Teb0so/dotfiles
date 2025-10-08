local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    -- Background container for the titlebar image
    local bg_container = wibox.container.background()

    local tbar = awful.titlebar(c, {
        size = 20,
        bg = "#00000000",
    })

    bg_container:setup {
        { -- Left
            {
                awful.titlebar.widget.iconwidget(c),
                bg = "#343434",
                widget = wibox.container.background,
            },
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.stickybutton(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            {
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }

    tbar:setup { bg_container, layout = wibox.layout.stack }

    -- Update function
    local function update_titlebar_bg()
        if client.focus == c then
            bg_container.bgimage = "/home/teb0so/.config/awesome/assets/titlebar_focused.png"
        else
            bg_container.bgimage = "/home/teb0so/.config/awesome/assets/titlebar_unfocused.png"
        end
    end

    c:connect_signal("focus", update_titlebar_bg)
    c:connect_signal("unfocus", update_titlebar_bg)

    update_titlebar_bg()
end)

