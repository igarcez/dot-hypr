#!/bin/bash

case "$1" in
    leader)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ffd599ee) rgba(ff6600ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword general:border_size 8 ;\
            keyword decoration:shadow:color rgba(ffd59988) ;\
            keyword decoration:shadow:range 15 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword animation borderangle,1,8,linear,loop"
        ;;
    apps)
        hyprctl --batch "\
            keyword general:col.active_border rgba(00ff88ee) rgba(00ccffee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword general:border_size 8 ;\
            keyword decoration:shadow:color rgba(00ff8899) ;\
            keyword decoration:shadow:range 25 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword animation borderangle,1,20,linear,loop"
        ;;
    navigation)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ff5577ee) rgba(ff00aaee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword general:border_size 8 ;\
            keyword decoration:shadow:color rgba(ff557799) ;\
            keyword decoration:shadow:range 25 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword animation borderangle,1,14,linear,loop"
        ;;
    movement)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ff6633ee) rgba(ffcc00ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword general:border_size 8 ;\
            keyword decoration:shadow:color rgba(ff663399) ;\
            keyword decoration:shadow:range 25 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword general:gaps_in 5 ;\
            keyword general:gaps_out 5 ;\
            keyword animation borderangle,1,10,linear,loop"
        ;;
    layout)
        hyprctl --batch "\
            keyword general:col.active_border rgba(bb55ffee) rgba(5500ffee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword general:border_size 10 ;\
            keyword decoration:shadow:color rgba(bb55ff99) ;\
            keyword decoration:shadow:range 30 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword general:gaps_in 5 ;\
            keyword general:gaps_out 5 ;\
            keyword animation borderangle,1,6,linear,loop"
        ;;
    service)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ffdd00ee) rgba(ff8800ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword general:border_size 8 ;\
            keyword decoration:shadow:color rgba(ffcc0099) ;\
            keyword decoration:shadow:range 25 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword animation borderangle,1,30,linear,loop"
        ;;
    reset)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ffffffff) rgba(888888ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(1a1a1aee) ;\
            keyword decoration:shadow:range 4 ;\
            keyword decoration:shadow:render_power 3 ;\
            keyword general:border_size 3 ;\
            keyword general:gaps_in 2 ;\
            keyword general:gaps_out 2 ;\
            keyword animation borderangle,1,5.39,easeOutQuint"
        ;;
esac
