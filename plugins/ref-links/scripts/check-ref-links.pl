#!/usr/bin/perl
# Stop hook: block a reply that cites a PR, issue or ticket without a link
# whose text carries its number and title. Ticket ids are checked only for
# the prefixes in CLAUDE_TICKET_PREFIXES (e.g. "ABC|XYZ").
use strict;
use warnings;
use utf8;
use JSON::PP;

my $in = eval { local $/; JSON::PP->new->utf8->decode(scalar <STDIN>) } or exit 0;
exit 0 if $in->{stop_hook_active};
my $msg = $in->{last_assistant_message} // '';
exit 0 unless length $msg;

my @prefixes = grep { /^[A-Z][A-Z0-9]*$/ } split /[|,\s]+/, ($ENV{CLAUDE_TICKET_PREFIXES} // '');
my $ticket = @prefixes ? '(?:' . join('|', @prefixes) . ')-\d+' : undef;
my $sep = qr/\s*[-–—:·]\s*\S/;

(my $text = $msg) =~ s/```.*?```//gs;
$text =~ s/`[^`\n]*`//g;

my @found;
while ($text =~ /\[([^\]]*)\]\(([^)\s]+)[^)]*\)/g) {
  my ($label, $url) = ($1, $2);
  if ($url =~ m{github\.com/[^/]+/[^/]+/(?:pull|issues)/(\d+)}) {
    push @found, "[$label] needs \"#$1 - title\"" unless $label =~ /#$1\b$sep/;
  } elsif ($url =~ m{linear\.app/[^/]+/issue/([A-Za-z][A-Za-z0-9]*-\d+)}) {
    my $id = $1;
    push @found, "[$label] needs \"\U$id\E - title\"" unless $label =~ /\b\Q$id\E\b$sep/i;
  }
}
$text =~ s/\[[^\]]*\]\([^)]*\)//g;

push @found, 'bare #number'     if $text =~ /(?<![\w\/#&])#\d+\b/;
push @found, 'bare GitHub URL'  if $text =~ m{https?://github\.com/\S+/(?:pull|issues)/\d+};
push @found, 'bare Linear URL'  if $text =~ m{https?://linear\.app/\S+/issue/};
push @found, 'bare ticket id'   if $ticket && $text =~ /\b$ticket\b/;
exit 0 unless @found;

binmode STDERR, ':encoding(UTF-8)';
print STDERR 'Reference links: ', join('; ', @found), <<'MSG';
.
Every PR, issue or ticket you cite must be a markdown link whose text has the
number AND the title: [#123 - Fix login redirect](https://github.com/owner/repo/pull/123)
or [ABC-45 - Add billing page](https://linear.app/workspace/issue/ABC-45).
Rewrite the reply with full links; fetch a missing title first
(gh pr view <n> --json title,url, or the tracker's issue tool).
MSG
exit 2;
