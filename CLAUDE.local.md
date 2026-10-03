# Personal instructions (rayyanarchy's fork)

This is my fork of AI Engineering from Scratch. `origin` is my fork, `upstream` is
rohitg00/ai-engineering-from-scratch. My study plan and progress live in `LEARNING.md`.

## End of session
When I say I'm done for the day (or anything similar: "wrapping up", "that's it for
today", "signing off", "gn"), without asking for confirmation:

1. Make sure `LEARNING.md` reflects today's progress (Progress log, Review queue, Path statuses).
2. `git add -A`, then commit with a message like `Progress YYYY-MM-DD: <lessons covered>`.
   Skip the commit if there is nothing to commit.
3. `git push origin main`.
4. Reply with a short recap: lessons done today, what's next, and the pushed commit hash.

If the push is rejected, run `git pull --no-edit origin main` and retry once; if that
fails, stop and tell me why.

## Upstream sync
A SessionStart hook (`.claude/hooks/sync-upstream.sh`) merges `upstream/main` into `main`
at startup. If it reports a conflict, help me resolve it before starting the lesson.
