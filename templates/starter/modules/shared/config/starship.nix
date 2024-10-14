{ pkgs, config, ...}:

let
    config = ''

            format = """
            $directory\
            $git_branch\
            $git_status\
            $fill\
            $python\
            $lua\
            $nodejs\
            $golang\
            $haskell\
            $rust\
            $ruby\
            $aws\
            $docker_context\
            $jobs\
            $cmd_duration\
            $line_break\
            $character"""

            # Отримання автозавершення вводу команд з config-schema.json
            "$schema" = 'https://starship.rs/config-schema.json'

            # Додавати порожні рядки між командними рядками
            add_newline = true

            # Заміняти символ '❯' в командному рядку на символ  '➜'
            [character] # Назва модуля, який ми налаштовуємо – 'character'
            success_symbol = '[➜](bold green)' # Частина 'success_symbol' буде використовувати символ '➜' підсвічений значенням 'bold green'

            # Вимкнути модуль package, повністю приховавши його в командному рядку

            [directory]
            format = '[$path ]($style)'
            truncation_length = 3
            truncation_symbol = '…/'
            truncate_to_repo = false
            read_only = " 󰌾"

            [git_branch]
            symbol = " "
            format = '[on](white) [$symbol$branch ]($style)'

            [git_status]
            style = 'fg:red'
            format = '([$all_status$ahead_behind]($style) )'

            [fill]
            symbol = ' '

            [aws]
            symbol = "  "

            [buf]
            symbol = " "

            [c]
            symbol = " "

            [conda]
            symbol = " "

            [crystal]
            symbol = " "

            [dart]
            symbol = " "

            [docker_context]
            symbol = " "

            [elixir]
            symbol = " "

            [elm]
            symbol = " "

            [fennel]
            symbol = " "

            [fossil_branch]
            symbol = " "

            [golang]
            symbol = " "

            [guix_shell]
            symbol = " "

            [haskell]
            symbol = " "

            [haxe]
            symbol = " "

            [hg_branch]
            symbol = " "

            [hostname]
            ssh_symbol = " "

            [java]
            symbol = " "

            [julia]
            symbol = " "

            [kotlin]
            symbol = " "

            [lua]
            symbol = " "

            [memory_usage]
            symbol = "󰍛 "

            [meson]
            symbol = "󰔷 "

            [nim]
            symbol = "󰆥 "

            [nix_shell]
            symbol = " "

            [nodejs]
            symbol = " "

            [ocaml]
            symbol = " "

            [os.symbols]
            Alpaquita = " "
            Alpine = " "
            AlmaLinux = " "
            Amazon = " "
            Android = " "
            Arch = " "
            Artix = " "
            CentOS = " "
            Debian = " "
            DragonFly = " "
            Emscripten = " "
            EndeavourOS = " "
            Fedora = " "
            FreeBSD = " "
            Garuda = "󰛓 "
            Gentoo = " "
            HardenedBSD = "󰞌 "
            Illumos = "󰈸 "
            Kali = " "
            Linux = " "
            Mabox = " "
            Macos = " "
            Manjaro = " "
            Mariner = " "
            MidnightBSD = " "
            Mint = " "
            NetBSD = " "
            NixOS = " "
            OpenBSD = "󰈺 "
            openSUSE = " "
            OracleLinux = "󰌷 "
            Pop = " "
            Raspbian = " "
            Redhat = " "
            RedHatEnterprise = " "
            RockyLinux = " "
            Redox = "󰀘 "
            Solus = "󰠳 "
            SUSE = " "
            Ubuntu = " "
            Unknown = " "
            Void = " "
            Windows = "󰍲 "

            [package]
            symbol = "󰏗 "

            [perl]
            symbol = " "

            [php]
            symbol = " "

            [pijul_channel]
            symbol = " "

            [python]
            symbol = " "

            [rlang]
            symbol = "󰟔 "

            [ruby]
            symbol = " "

            [rust]
            symbol = "󱘗 "

            [scala]
            symbol = " "

            [swift]
            symbol = " "

            [zig]
            symbol = " "
            '';
in
{
    ".config/starship.toml" = {
        text = config;
    };
}