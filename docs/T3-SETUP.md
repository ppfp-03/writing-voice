# T3 multi-agent setup

This setup assumes Claude orchestrates tasks and launches Claude and OpenAI
workers. Exact launch commands, process isolation, instruction loading, and
filesystem access are environment-specific and have not been inspected here.
OpenAI model access is not automatically a Codex CLI installation.

## Required layers

1. Install the skill where each actual worker can read it. The helper supports
   conventional Claude Code and Codex CLI directories. For custom processes or
   API workers pass the skill text/context explicitly instead.
2. Put the persistent policy in the instruction files actually loaded by the
   orchestrator. For Claude Code this commonly includes CLAUDE.md; for Codex
   workflows inspect the applicable AGENTS.md and invocation settings.
3. Propagate the policy to every writing worker. Do not assume parent conversation
   or previously loaded skill content is inherited.
4. Require the orchestrator to review the assembled final prose.

## Delegation contract

For each prose task, supply:
- task, audience, genre, language, and revision depth;
- resolved accessible path to SKILL.md, or its contents through supported context;
- relevant project instructions and source materials;
- protected items and output contract;
- a requirement to read/apply the skill before drafting.

If access fails, report the failure and supply the context through a supported
mechanism. Do not claim a worker read a file without execution evidence.
Do not ask workers to reveal internal reasoning; request deliverables and relevant
verification status only. Use lightweight checks for brief messages.

## Thesis integration

The separate instructions repository should add a short requirement and a resolved
skill location/version, not duplicate the full catalog. Preserve thesis-specific
research rules. Pin an approved writing-voice commit and deliberately update the
local copy. Updating GitHub alone does not update local clones or worker context.
No Thesis repository is changed by this package.

## Verify your setup

In a fresh session, ask the orchestrator to identify the accessible skill path.
Delegate a short editing task to each worker and inspect available execution
records for file access/invocation. Compare results for preservation of numbers,
quotes, citations, uncertainty, and genre. A worker's unsupported self-report is
not proof. Test deliberately unavailable paths to confirm failure is surfaced.
Treat all-path enforcement as unverified until tested in the actual environment.
