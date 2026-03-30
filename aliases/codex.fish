# Codex CLI aliases
# see: https://developers.openai.com/codex

if type -q codex
    alias codex 'codex --model gpt-5.4'
    alias cx 'codex --model gpt-5.4 --full-auto'
    alias cxd 'codex --model gpt-5.4 --dangerously-bypass-approvals-and-sandbox'
end
