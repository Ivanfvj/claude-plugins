#!/usr/bin/perl
# SessionStart hook: put the reference-link rule in Claude's context.
use strict;
use warnings;
use utf8;
use JSON::PP;

my @prefixes = grep { /^[A-Z][A-Z0-9]*$/ } split /[|,\s]+/, ($ENV{CLAUDE_TICKET_PREFIXES} // '');

my $rule = <<'RULE';
Reference links (output contract, enforced by a Stop hook):
- Every pull request or GitHub issue you mention is a markdown link whose text is its number AND title: [#123 - Fix login redirect](https://github.com/owner/repo/pull/123).
- Every ticket you mention follows the same form: [ABC-45 - Add billing page](https://linear.app/workspace/issue/ABC-45).
- Never a bare number, a bare identifier or a bare URL. Brevity, bullet summaries and length caps are no exemption.
- Unknown title or URL? Fetch it first (`gh pr view <n> --json title,url`, or the tracker's issue tool). If a reference can't carry a link, name it in prose instead ("the routing PR").
- Code blocks and inline code are exempt, so a command or file path may carry a bare number.
RULE
$rule .= "- This project's ticket prefixes: " . join(', ', @prefixes) . ".\n" if @prefixes;

binmode STDOUT, ':encoding(UTF-8)';
print JSON::PP->new->encode({
  hookSpecificOutput => { hookEventName => 'SessionStart', additionalContext => $rule },
});
