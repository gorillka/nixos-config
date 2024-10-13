{ pkgs, config, ...}:

let
    config = ''

            '';
in
{
    ".template.test" = {
        text = config;
    };
}