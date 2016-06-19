/*
* Copyright (c) 2016 elementary LLC (https://launchpad.net/granite)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 59 Temple Place - Suite 330,
* Boston, MA 02111-1307, USA.
*
*/

namespace Granite.Widgets {
    public class SidebarRow : Gtk.ListBoxRow {
        private Gtk.Image button_image;
        private Gtk.Image icon;
        private Gtk.Label badge_label;
        private Gtk.Revealer revealer;

        public SidebarRow (string label, string icon_name) {
            icon = new Gtk.Image.from_icon_name (icon_name, Gtk.IconSize.BUTTON);

            var row_label = new Gtk.Label (label);
            row_label.halign = Gtk.Align.START;
            row_label.hexpand = true;

            badge_label = new Gtk.Label ("");
            badge_label.get_style_context ().add_class ("badge");
            badge_label.valign = Gtk.Align.CENTER;
            badge_label.no_show_all = true;

            button_image = new Gtk.Image ();
            button_image.icon_size = Gtk.IconSize.BUTTON;

            var button = new Gtk.Button ();
            button.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
            button.image = button_image;

            revealer = new Gtk.Revealer ();
            revealer.transition_type = Gtk.RevealerTransitionType.CROSSFADE;
            revealer.add (button);

            var layout = new Gtk.Grid ();
            layout.margin_start = 6;
            layout.add (icon);
            layout.add (row_label);
            layout.add (revealer);
            layout.add (badge_label);

            get_style_context ().add_class ("sidebar-item");
            add (layout);
        }

        public int badge {
            set {
                badge_label.label = value.to_string ();
                if (value != 0) {
                    badge_label.visible = true;
                }
            }
        }

        public string icon_name {
            set {
                icon.icon_name = value;
            }
        }

        public string button_icon_name {
            set {
                button_image.icon_name = value;
            }
        }

        public bool reveal_button {
            set {
                revealer.reveal_child = value;
            }
        }
    }
}
