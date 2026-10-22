#!/usr/bin/env bash
# Run: bash plugins/ref-links/tests/check-ref-links.test.sh
# Fails if the Stop hook passes a bad reference or blocks a good one.
set -u
hook="$(cd "$(dirname "$0")/.." && pwd)/scripts/check-ref-links.pl"
fails=0

run() { # expected-exit message [prefixes]
  local want=$1 msg=$2 got
  jq -n --arg m "$msg" '{last_assistant_message: $m, stop_hook_active: false}' |
    CLAUDE_TICKET_PREFIXES="${3-}" perl "$hook" 2>/dev/null
  got=$?
  if [ "$got" != "$want" ]; then
    echo "FAIL (want $want, got $got): $msg"
    fails=$((fails + 1))
  fi
}

# Pass
run 0 'See [#5 - Fix login](https://github.com/o/r/pull/5).'
run 0 'Done: [ABC-12 - Add billing](https://linear.app/w/issue/ABC-12/add-billing).' ABC
run 0 'Run `gh pr view 5` and see #fff colors.'
run 0 $'```\nfix #42 and ABC-9\n```' ABC
run 0 'Ticket ABC-12 here, but no prefixes configured.'
run 0 'Question Q#12 and an anchor /docs#12.'
run 0 ''

# Block
run 2 'Merged #5 today.'
run 2 'Merged PR #158.'
run 2 'See https://github.com/o/r/pull/5 for details.'
run 2 'See https://linear.app/w/issue/ABC-12 for details.'
run 2 'Working on ABC-12.' ABC
run 2 'See [#5](https://github.com/o/r/pull/5).'
run 2 'See [the PR](https://github.com/o/r/pull/5).'
run 2 'See [ABC-12](https://linear.app/w/issue/ABC-12).' ABC

# Never loop: a second block in the same turn is let through.
jq -n '{last_assistant_message: "Merged #5", stop_hook_active: true}' | perl "$hook" 2>/dev/null ||
  { echo "FAIL: blocked while stop_hook_active"; fails=$((fails + 1)); }

[ "$fails" = 0 ] && echo "ok" || { echo "$fails failed"; exit 1; }
