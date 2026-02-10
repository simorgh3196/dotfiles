# Main command completion
complete -c claude -f

# Options completion
complete -c claude -s d -l debug -d "Enable debug mode"
complete -c claude -l verbose -d "Override verbose mode setting from config"
complete -c claude -s p -l print -d "Print response and exit (useful for pipes)"
complete -c claude -l output-format -d "Output format (only works with --print)" -xa "text json stream-json"
complete -c claude -l input-format -d "Input format (only works with --print)" -xa "text stream-json"
complete -c claude -l mcp-debug -d "[DEPRECATED. Use --debug instead] Enable MCP debug mode"
complete -c claude -l dangerously-skip-permissions -d "Bypass all permission checks"
complete -c claude -l allowedTools -d "Comma or space-separated list of tool names to allow"
complete -c claude -l disallowedTools -d "Comma or space-separated list of tool names to deny"
complete -c claude -l mcp-config -d "Load MCP servers from a JSON file or string" -rF
complete -c claude -s c -l continue -d "Continue the most recent conversation"
complete -c claude -s r -l resume -d "Resume a conversation - provide a session ID or interactively select"
complete -c claude -l model -d "Model for the current session" -xa "sonnet opus claude-sonnet-4-20250514"
complete -c claude -l fallback-model -d "Enable automatic fallback to specified model" -xa "sonnet opus claude-sonnet-4-20250514"
complete -c claude -l add-dir -d "Additional directories to allow tool access to" -xa "(__fish_complete_directories)"
complete -c claude -l ide -d "Automatically connect to IDE on startup if exactly one valid IDE is available"
complete -c claude -s v -l version -d "Output the version number"
complete -c claude -s h -l help -d "Display help for command"

# Subcommands completion
complete -c claude -n "not __fish_seen_subcommand_from config mcp migrate-installer doctor update install" -xa "config mcp migrate-installer doctor update install"

# config subcommand
complete -c claude -n "__fish_seen_subcommand_from config" -xa "set get list reset"
complete -c claude -n "__fish_seen_subcommand_from config; and __fish_seen_subcommand_from set" -s g -l global -d "Set global configuration"

# mcp subcommand
complete -c claude -n "__fish_seen_subcommand_from mcp" -xa "list add remove enable disable"

# install subcommand options
complete -c claude -n "__fish_seen_subcommand_from install" -xa "stable latest"
complete -c claude -n "__fish_seen_subcommand_from install" -l force -d "Force installation"

# Function to check if we're in a subcommand context
function __fish_claude_using_subcommand
    set -l cmd (commandline -opc)
    if test (count $cmd) -ge 2
        switch $cmd[2]
            case config mcp migrate-installer doctor update install
                return 0
        end
    end
    return 1
end

# Prevent option completion after subcommands (except for specific cases)
complete -c claude -n __fish_claude_using_subcommand -s d -l debug -d "Enable debug mode"
complete -c claude -n __fish_claude_using_subcommand -l verbose -d "Override verbose mode setting from config"
complete -c claude -n __fish_claude_using_subcommand -s h -l help -d "Display help for command"
