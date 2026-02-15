#!/bin/bash

case "$1" in
    leader)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ffd599ee) ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(ffd59966) ;\
            keyword decoration:shadow:range 10 ;\
            keyword decoration:shadow:render_power 2"
        ;;
    apps)
        hyprctl --batch "\
            keyword general:col.active_border rgba(00ff88ee) rgba(00cc66ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(00ff8877) ;\
            keyword decoration:shadow:range 20 ;\
            keyword decoration:shadow:render_power 2"
        ;;
    navigation)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ff5577ee) rgba(dd3355ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(ff557777) ;\
            keyword decoration:shadow:range 20 ;\
            keyword decoration:shadow:render_power 2"
        ;;
    movement)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ff6633ee) rgba(ff3333ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(ff663377) ;\
            keyword decoration:shadow:range 20 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword general:gaps_in 5 ;\
            keyword general:gaps_out 5"
        ;;
    layout)
        hyprctl --batch "\
            keyword general:col.active_border rgba(bb55ffee) rgba(8833ffee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(bb55ff77) ;\
            keyword decoration:shadow:range 20 ;\
            keyword decoration:shadow:render_power 2 ;\
            keyword general:border_size 5 ;\
            keyword general:gaps_in 5 ;\
            keyword general:gaps_out 5"
        ;;
    service)
        hyprctl --batch "\
            keyword general:col.active_border rgba(ffcc00ee) rgba(ffaa00ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(ffcc0077) ;\
            keyword decoration:shadow:range 20 ;\
            keyword decoration:shadow:render_power 2"
        ;;
    reset)
        hyprctl --batch "\
            keyword general:col.active_border rgba(33ccffee) rgba(00ff99ee) 45deg ;\
            keyword general:col.inactive_border rgba(00000000) ;\
            keyword decoration:shadow:color rgba(1a1a1aee) ;\
            keyword decoration:shadow:range 4 ;\
            keyword decoration:shadow:render_power 3 ;\
            keyword general:border_size 3 ;\
            keyword general:gaps_in 2 ;\
            keyword general:gaps_out 2"
        ;;
esac
