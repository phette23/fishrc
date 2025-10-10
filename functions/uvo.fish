function uvo --wraps='uv tree --outdated --depth 1 --all-groups' --description 'alias uvo uv tree --outdated --depth 1 --all-groups'
    uv tree --outdated --depth 1 --all-groups $argv
end
