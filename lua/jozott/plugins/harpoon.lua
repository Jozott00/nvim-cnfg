return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        local wk = require("which-key")

        wk.register({
            h = {
                a = { mark.add_file, "Add file to harpoon" },
                u = { ui.toggle_quick_menu, "Show harpoon ui" },

                ["1"] = { function() ui.nav_file(1) end, "Jump to file 1" },
                ["2"] = { function() ui.nav_file(2) end, "Jump to file 2" },
                ["3"] = { function() ui.nav_file(3) end, "Jump to file 3" },
                ["4"] = { function() ui.nav_file(4) end, "Jump to file 4" },
                ["5"] = { function() ui.nav_file(5) end, "Jump to file 5" },

            }
        }, { prefix = "<leader>" })
    end
}
